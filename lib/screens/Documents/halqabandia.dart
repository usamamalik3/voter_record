import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:voterrecord/screens/documents/pdf_viewer_page.dart';

class HalqaBandia extends StatefulWidget {
  const HalqaBandia({super.key});

  @override
  State<HalqaBandia> createState() => _HalqaBandiaState();
}

class _HalqaBandiaState extends State<HalqaBandia> {
  String uRl ="https://firebasestorage.googleapis.com/v0/b/voterrecord-95705.appspot.com/o/Form-5%20National%20Assembly_compressed.pdf";
  String uRl1 ="https://firebasestorage.googleapis.com/v0/b/voterrecord-95705.appspot.com/o/Form-5%20Provincial%20Assembly%20of%20Pakistan.pdf";

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
    loadPdfFromNetwork(uRl1);
  
  }

  @override
  Widget build(BuildContext context) {
    var storageReference = FirebaseStorage.instance.refFromURL(uRl);
    var storageReference1 = FirebaseStorage.instance.refFromURL(uRl1);
    String name = storageReference.name;
    String name1 = storageReference1.name;


    return Scaffold(
      appBar: AppBar(),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [
              Padding(
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
                        })),
              ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Card(
                    child: ListTile(
                        title: Text(name1),
                        leading: const Icon(Icons.picture_as_pdf),
                        trailing: const Icon(
                          Icons.arrow_forward,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PdfViewerPage(
                                      url: uRl1,
                                    )),
                          );
                        })),
                 ),
            ],
          )),
    );
  }
}
