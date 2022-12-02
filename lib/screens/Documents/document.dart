import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:voterrecord/screens/documents/pdf_viewer_page.dart';

class DocumentScreen extends StatefulWidget {
  const DocumentScreen({super.key});

  @override
  State<DocumentScreen> createState() => _DocumentScreenState();
}

class _DocumentScreenState extends State<DocumentScreen> {
  String uRl ="https://firebasestorage.googleapis.com/v0/b/voterrecord-95705.appspot.com/o/Form-5%20National%20Assembly_compressed.pdf?alt=media&token=c45a6cb4-d7b6-4a41-8584-1df90d2a95dd";
 

  Future<File> loadPdfFromNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    final bytes = response.bodyBytes;
    return _storeFile(url, bytes);
  }

  Future<File> _storeFile(String url, List<int> bytes) async {
    final filename = basename(url);
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$filename');
    await file.writeAsBytes(bytes, flush: true);

    return file;
  }

  //final file = File('example.pdf');
  //await file.writeAsBytes(await pdf.save());

  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPdfFromNetwork(uRl);
  
  }

  @override
  Widget build(BuildContext context) {
    var storageReference = FirebaseStorage.instance.refFromURL(uRl);
    String name = storageReference.name;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
              child: ListTile(
                  title: Text(name),
                  leading: const Icon(Icons.picture_as_pdf),
                  trailing: const Icon(
                    Icons.arrow_forward,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PdfViewerPage(
                                url: uRl,
                              )),
                    );
                  }))),
    );
  }
}
