import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

 import 'package:flutter/material.dart';
import 'package:voterrecord/models/employee.dart';
import 'package:voterrecord/screens/tanzeemSazi/employee_datasource.dart';
class TableData extends StatefulWidget {
  const TableData({super.key});

  @override
  State<TableData> createState() => _TableDataState();
}

class _TableDataState extends State<TableData> {
  late EmployeeDataSource _employeeDataSource;
  List<Employee> _employees = <Employee>[];
  late DataGridController _dataGridController;

  @override
  void initState() {
    super.initState();
    _employees = getEmployeeData();
    _employeeDataSource = EmployeeDataSource(_employees);
    _dataGridController = DataGridController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SfDataGrid(
           horizontalScrollPhysics: const AlwaysScrollableScrollPhysics(),
          verticalScrollPhysics: const AlwaysScrollableScrollPhysics(),
          source: _employeeDataSource,
          allowEditing: true,
          selectionMode: SelectionMode.single,
          navigationMode: GridNavigationMode.cell,
          columnWidthMode: ColumnWidthMode.fill,
          controller: _dataGridController,
          
          columns: [
            GridColumn(
              columnWidthMode: ColumnWidthMode.fitByCellValue,
              allowEditing: false,
              columnName: 'position',
              label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
              alignment: Alignment.centerRight,
                child: const Text(
                  "پوزیشن",
                  
                  style: TextStyle(fontFamily: "NotoNastaliqUrdu",),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridColumn(
              columnName: 'name',
              columnWidthMode: ColumnWidthMode.fitByCellValue,
              label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerRight,
                child: const Text(
                  'نام',
                  
                  style: TextStyle(fontFamily: "NotoNastaliqUrdu", ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridColumn(
              columnName: 'phoenno',
              columnWidthMode: ColumnWidthMode.fitByCellValue,
              label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerRight,
                child: const Text(
                  'فون نمبر',
                   style: TextStyle(fontFamily: "NotoNastaliqUrdu",),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            GridColumn(
              columnName: 'address',
              columnWidthMode: ColumnWidthMode.fitByCellValue,
              label: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerRight,
                child: const Text(
                  'پتہ',
                  style: TextStyle(fontFamily: "NotoNastaliqUrdu",),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee("سرپرستِ اعلیٰ", 'ارحم ملک', '0324689567', "7 اور 8 فرسٹ فلور ہل ویو پلازہ بلیو ایریا اسلام آباد"),
      Employee("امیر", '', '', ""),
      Employee("نائب امیر", '', '', ""),
      Employee("ناظم اعلیٰ", '', '', ""),
      Employee("نائب ناظم اعلیٰ", '', '', ""),
      Employee("ناظم مالیات", '', '', ""),
      Employee("ناظم نشرواشاعت", '', '', ""),
      Employee("ناظم خدمتِ خلق", '', '', ""),
      Employee("رابطہ ناظم برائے تنظیم", '', '', ""),
      Employee("رابطہ ناظم برائے انتظامیہ", '', '', ""),
      Employee("قانونی مشیر", '', '', ""),
      Employee("سیکورٹی انچارج", '', '', ""),
      Employee("ناظم انتخابی اُمور", '', '', ""),
      Employee("تحریکی ڈیزائنر", '', '', ""),
      Employee("ناظم دفتر", '', '', ""),
    ];
  }
}