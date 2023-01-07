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
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 10),
          child: Card(
            elevation: 10,
            child: RepaintBoundary(
              key: _printKey,
              child: Padding(
                padding: const EdgeInsets.only(left:8.0, right: 15, top: 10 ,bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ListTile(
                      title: const Padding(
                        padding: EdgeInsets.only(
                          right: 8,
                        ),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "شناختی کارڈ",
                              style: TextStyle(
                                  fontFamily: "NotoNastaliqUrdu", fontSize: 16),
                            )),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          widget.voter.cnic.toString(),
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.voter.name.toString(),
                                style: const TextStyle(
                                    fontFamily: "NotoNastaliqUrdu",
                                    fontSize: 12)),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(':نام',
                                  style:  TextStyle(
                                      fontFamily: "NotoNastaliqUrdu",
                                      fontSize: 14)),
                            ),
                          ],
                        ),
                       
                      ],
                    ),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.voter.fathername.toString(),
                                style: const TextStyle(
                                    fontFamily: "NotoNastaliqUrdu",
                                    fontSize: 12)),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(':والد/شوہر کا نام',
                                  style:  TextStyle(
                                      fontFamily: "NotoNastaliqUrdu",
                                      fontSize: 14)),
                            ),
                          ],
                        ),
                      ],
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                         
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.voter.gender.toString(),
                                style: const TextStyle(
                                    fontFamily: "NotoNastaliqUrdu",
                                    fontSize: 12)),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(':جنس',
                                  style:  TextStyle(
                                      fontFamily: "NotoNastaliqUrdu",
                                      fontSize: 14)),
                            ),
                          ],
                        ),
                        SizedBox(width: 10,),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.voter.serialno.toString(),
                                style: const TextStyle(
                                    fontFamily: "NotoNastaliqUrdu",
                                    fontSize: 12)),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(':سلسہ نمبر',
                                  style:  TextStyle(
                                      fontFamily: "NotoNastaliqUrdu",
                                      fontSize: 14)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.voter.age.toString(), style: const TextStyle(
                                    fontFamily: "NotoNastaliqUrdu",
                                    fontSize: 12)),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(':عمر',
                                  style:  TextStyle(
                                      fontFamily: "NotoNastaliqUrdu",
                                      fontSize: 14)),
                            ),
                          ],
                        ),
                        SizedBox(width: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.voter.householdno.toString(),
                                style: const TextStyle(
                                    fontFamily: "NotoNastaliqUrdu",
                                    fontSize: 12)),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(':گھرانہ نمبر',
                                  style:  TextStyle(
                                      fontFamily: "NotoNastaliqUrdu",
                                      fontSize: 14)),
                            ),
                          ],
                        ),
                        
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(widget.voter.stcode.toString(),
                            style: const TextStyle(
                                fontFamily: "NotoNastaliqUrdu",
                                fontSize: 12)),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(":شماریاتی بلاک کوڈ",
                              style:  TextStyle(
                                  fontFamily: "NotoNastaliqUrdu",
                                  fontSize: 14)),
                        ),
                      ],
                    ),
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(widget.voter.address.toString(),
                                style: const TextStyle(
                                    fontFamily: "NotoNastaliqUrdu",
                                    fontSize: 12)),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(":پتہ",
                                  style:  TextStyle(
                                      fontFamily: "NotoNastaliqUrdu",
                                      fontSize: 14)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(widget.voter.polingstion.toString(),
                            style: const TextStyle(
                                fontFamily: "NotoNastaliqUrdu",
                                fontSize: 12)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(":پولنگ اسٹیشن",style: TextStyle(
                                fontFamily: "NotoNastaliqUrdu",
                                fontSize: 14)),
                        ),
                      ],
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: ChoiceChip(
                                
                                  label: const Text(
                                    'حامی',
                                    textAlign: TextAlign.center,
                                   
                                  ),
                                  
                                 
                                  labelPadding: const EdgeInsets.symmetric(
                                      horizontal: 50),
                                  selected:  choice == 'حامی',
                                   labelStyle:  TextStyle(
                                    
                                      color: choice == 'حامی' ? Colors.white : Colors.black, fontSize: 14, fontFamily: "NotoNastaliqUrdu"),
                                  onSelected: (bool selected) {
                                    setState(() {
                                      choice = selected ? 'حامی' : null;
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
                                    ),
                                  labelPadding: const EdgeInsets.symmetric(
                                      horizontal: 50,),
                                  selected: choice == 'مخالف',
                                  labelStyle: TextStyle(color: choice == 'مخالف'? Colors.white: Colors.black, fontSize: 14, fontFamily: "NotoNastaliqUrdu"),
                                  onSelected: (bool selected) {
                                    setState(() {
                                      choice = selected ? 'مخالف' : null;
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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: _printScreen,
        child: const Icon(Icons.print),
      ),
    );
  }
}
