import 'package:horizontal_data_table/horizontal_data_table.dart';

 import 'package:flutter/material.dart';
class TableData extends StatefulWidget {
  const TableData({super.key});

  @override
  State<TableData> createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  @override
  Widget build(BuildContext context) {
    return  Expanded(
         child: Padding(
           padding: const EdgeInsets.all(8.0),
           child: HorizontalDataTable(
            
            enableRTL: true,
            leftHandSideColumnWidth: 100,
            rightHandSideColumnWidth: 600,
            isFixedHeader: true,
            headerWidgets: _getTitleWidget(),
            leftSideItemBuilder: _generateFirstColumnRow,
            rightSideItemBuilder: _generateRightHandSideColumnRow,
            itemCount: 15,
            rowSeparatorWidget: const Divider(
              color: Colors.black54,
              height: 1.0,
              thickness: 0.4,
            ),
            leftHandSideColBackgroundColor: Colors.white,
            rightHandSideColBackgroundColor: Colors.white,
      ),
         ),
       );}
List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('پوزیشن', 100),
      _getTitleItemWidget('نام', 100),
      _getTitleItemWidget('فون نمبر', 100),
      _getTitleItemWidget('پتہ', 100),
      
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerRight,
      child: Text(label, textAlign: TextAlign.right, textDirection: TextDirection.rtl, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "NotoNastaliqUrdu")),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 100,
      height: 52,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerRight,
      child: const Padding(
        padding: EdgeInsets.only(right:10.0),
        child: Text("پوزیشن",style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "NotoNastaliqUrdu")),
      ),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerRight,
          child: const Text(''),
        ),
        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerRight,
          child: const Text(""),
        ),
        Container(
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerRight,
          child: const Text(""),
        ),
      
      ],
    );
  }
  }
