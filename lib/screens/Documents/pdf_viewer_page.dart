import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerPage extends StatefulWidget {

  final String url;

  const PdfViewerPage({
    Key? key,
    
    required this.url,
  }) : super(key: key);

  @override
  State<PdfViewerPage> createState() => _PdfViewerPageState();
}

class _PdfViewerPageState extends State<PdfViewerPage> {
 
  @override
  Widget build(BuildContext context) {
    var storageReference = FirebaseStorage.instance.refFromURL(widget.url);
    String name = storageReference.name;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          IconButton(
            onPressed: () async {
              await saveFile(widget.url, name);
              
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'successfully saved to internal storage "PDF_Download" folder',
                    style: TextStyle(color: Colors.white),
                  ),
                ), 
              );
            },
            icon: const Icon(Icons.download_rounded),
          ),
        ],
      ),
      body:SfPdfViewer.network(
      widget.url,
    ),
    );
  }

  Future<bool> saveFile(String url, String fileName) async {
    try {
      if (await _requestPermission(Permission.storage)) {
        Directory? directory;
        directory = await getExternalStorageDirectory();
        String newPath = "";
        List<String> paths = directory!.path.split("/");
        for (int x = 1; x < paths.length; x++) {
          String folder = paths[x];
          if (folder != "Android") {
            newPath += "/$folder";
          } else {
            break;
          }
        }
        newPath = "$newPath/PDF_Download";
        directory = Directory(newPath);

        File saveFile = File("${directory.path}/$fileName");
        // if (kDebugMode) {
        //   print(saveFile.path);
        // }
        if (!await directory.exists()) {
          await directory.create(recursive: true);
        }
        if (await directory.exists()) {
          await Dio().download(
            url,
            saveFile.path,
          );
        }
      }
      return true;
    } catch (e) {
      SnackBar(
                  content: Text(
                    e.toString(),
                    style: TextStyle(color: Colors.white),));
      return false;
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
  }
}
