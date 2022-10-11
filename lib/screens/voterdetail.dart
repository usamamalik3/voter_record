

import 'package:flutter/material.dart';
import 'package:voterrecord/global/widgets/readonlytextfield.dart';
import 'package:voterrecord/models/voter.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Voterdetail extends StatelessWidget {
  final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();

  void _printScreen() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      final image = await WidgetWraper.fromKey(
        key: _printKey,
        pixelRatio: 2.0,
      );

      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Expanded(
                child: pw.Image(image),
              ),
            );
          }));

      return doc.save();
    });
  }

  final Voter voter;
   Voterdetail({super.key, required this.voter});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: RepaintBoundary(
          key: _printKey,
          child: Card(
            
           
            elevation: 10,
            
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:  [
                ListTile(
              title: const Padding(
                padding: EdgeInsets.only(right: 8,),
                child: Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "شناختی کارڈ",
                      style: TextStyle(fontFamily: "NotoNastaliqUrdu",fontSize: 16),
                    )),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(left:8),
                child: Text(voter.cnic.toString(),
                style: const TextStyle(fontSize: 20),),
              ),
              ),
             ReadTextField(title: 'نام', value: voter.name.toString(),),
            ReadTextField(title: 'والد/شوہر کا نام', value: voter.fathername.toString(),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
              width: width*0.45,
              child: ReadTextField(title: 'جنس', value: voter.gender.toString(),)),
              SizedBox(
              width: width*0.45,
              child: ReadTextField(title: 'عمر', value: voter.age.toString(),)),
              ],          
            ),
            ReadTextField(value: voter.stcode.toString(), title: "شماریاتی بلاک کوڈ"),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
              width: width*0.45,
              child: ReadTextField(title: 'سلسہ نمبر', value: voter.serialno.toString(),)),
              SizedBox(
              width: width*0.45,
              child: ReadTextField(title: 'گھرانہ نمبر', value: voter.householdno.toString(),)),
              ],          
            ),
            ReadTextField(value: voter.address.toString(), title: "پتہ"),
            ReadTextField(value: voter.polingstion.toString(), title: "پولنگ اسٹیشن"),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: width*0.3,
                height: 40,
           
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(16.0))
                ),
                child: Center(child: Text(voter.choicechip.toString())),
               
              ),
            ),
            
            
              ],
            ),
          ),
          
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: _printScreen,
        child: const Icon(Icons.print),
      ),
    );
  }
}