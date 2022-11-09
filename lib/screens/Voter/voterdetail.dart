

import 'package:flutter/material.dart';
import 'package:voterrecord/global/widgets/readonlytextfield.dart';
import 'package:voterrecord/models/voter.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Voterdetail extends StatefulWidget {
  final Voter voter;

   const Voterdetail({super.key, required this.voter});

  @override
  State<Voterdetail> createState() => _VoterdetailState();
}

class _VoterdetailState extends State<Voterdetail> {
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

  String? choice = "حامی";

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Card(
          
         
          elevation: 10,
          
          child: RepaintBoundary(
            key: _printKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                  child: Text(widget.voter.cnic.toString(),
                  style: const TextStyle(fontSize: 20),),
                ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
               
                SizedBox(
                    width: width*0.3,
                    child: ReadTextField(title: 'نام', value: widget.voter.name.toString(),)),
                 SizedBox(
                width: width*0.3,
                child: ReadTextField(title: 'جنس', value: widget.voter.gender.toString(),)),
                ],
              ),
           
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                SizedBox(
                width: width*0.25,
                child: ReadTextField(title: 'جنس', value: widget.voter.gender.toString(),)),
                SizedBox(
                width: width*0.25,
                child: ReadTextField(title: 'عمر', value: widget.voter.age.toString(),)),
                 SizedBox(
                width: width*0.4,
                child: ReadTextField(title: 'والد/شوہر کا نام', value: widget.voter.fathername.toString(),)),
                ],          
              ),
            
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    SizedBox(
                width: width*0.3,
                child: ReadTextField(value: widget.voter.stcode.toString(), title: "شماریاتی بلاک کوڈ")),
                    SizedBox(
                width: width*0.3,
                child: ReadTextField(title: 'گھرانہ نمبر', value: widget.voter.householdno.toString(),)),
                  SizedBox(
                width: width*0.3,
                child: ReadTextField(title: 'سلسہ نمبر', value: widget.voter.serialno.toString(),)),
              
                ],          
              ),
              ReadTextField(value: widget.voter.address.toString(), title: "پتہ"),
              ReadTextField(value: widget.voter.polingstion.toString(), title: "پولنگ اسٹیشن"),
               Row(  
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: ChoiceChip(
                                   
                                    label: const Text('حامی',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                    labelPadding:
                                        const EdgeInsets.symmetric(horizontal: 50),
                                    selected: choice== 'حامی',
                                    onSelected: (bool selected) {
                                      setState(() {
                                        choice= selected ? 'حامی' : null;
                                      });
                                    },
                                    selectedColor: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)))),
                            Expanded(
                                child: ChoiceChip(
                                  
                                    label: const Text('مخالف',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20)),
                                    labelPadding:
                                        const EdgeInsets.symmetric(horizontal: 50),
                                    selected: choice== 'مخالف',
                                    onSelected: (bool selected) {
                                      setState(() {
                                        choice= selected ? 'مخالف' : null;
                                      });
                                    },
                                    selectedColor: Theme.of(context).primaryColor,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0))))
                          ]),
                          
              
              
                ],
              ),
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