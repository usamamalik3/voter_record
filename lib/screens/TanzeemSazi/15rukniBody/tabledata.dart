import 'package:cloud_firestore/cloud_firestore.dart';
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
  late EmployeeDataSource employeeDataSource;
  List<Employee> employeeData = [];
  late DataGridController _dataGridController;

  final getData = FirebaseFirestore.instance
      .collection('Employees')
      .where("location", isEqualTo: "ملتان")
      .orderBy("Position", descending: true)
      .snapshots();

  Widget _buildDataGrid() {
    return StreamBuilder(
      stream: getData,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          if (employeeData.isNotEmpty) {
            for (var data in snapshot.data!.docChanges) {
              if (data.type == DocumentChangeType.modified) {
                if (data.oldIndex == data.newIndex) {
                  employeeDataSource.dataGridRows[data.oldIndex] =
                      getDataGridRowFromDataBase(data);
                }
                employeeDataSource.updateDataGridSource();
              } else if (data.type == DocumentChangeType.added) {
                employeeDataSource.dataGridRows
                    .add(getDataGridRowFromDataBase(data));
                employeeDataSource.updateDataGridSource();
              } else if (data.type == DocumentChangeType.removed) {
                employeeDataSource.dataGridRows.removeAt(data.oldIndex);
                employeeDataSource.updateDataGridSource();
              }
            }
          } else {
            for (var data in snapshot.data!.docs) {
              employeeData.add(Employee(data["Position"], data["Name"],
                  data["Phone no"], data["Address"], data["location"]));
            }
            employeeDataSource = EmployeeDataSource(employeeData);
          }

          return Directionality(
            textDirection: TextDirection.rtl,
            child: SfDataGrid(
              horizontalScrollPhysics: const AlwaysScrollableScrollPhysics(),
              verticalScrollPhysics: const AlwaysScrollableScrollPhysics(),
              allowEditing: true,
              selectionMode: SelectionMode.single,
              navigationMode: GridNavigationMode.cell,
              columnWidthMode: ColumnWidthMode.fill,
              controller: _dataGridController,
              source: employeeDataSource,
              columns: <GridColumn>[
                GridColumn(
                  columnWidthMode: ColumnWidthMode.fitByCellValue,
                  allowEditing: false,
                  columnName: 'position',
                  label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerRight,
                    child: const Text(
                      "پوزیشن",
                      style: TextStyle(
                        fontFamily: "NotoNastaliqUrdu",
                      ),
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
                      style: TextStyle(
                        fontFamily: "NotoNastaliqUrdu",
                      ),
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
                      style: TextStyle(
                        fontFamily: "NotoNastaliqUrdu",
                      ),
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
                      style: TextStyle(
                        fontFamily: "NotoNastaliqUrdu",
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  // to update the value changed at runtime
  getDataGridRowFromDataBase(DocumentChange<Object?> data) {
    return DataGridRow(cells: [
      DataGridCell<String>(columnName: 'position', value: data.doc['Position']),
      DataGridCell<String>(columnName: 'name', value: data.doc['Name'] ?? ""),
      DataGridCell<String>(
          columnName: 'Phoneno', value: data.doc['Phone no'] ?? ""),
      DataGridCell<String>(
          columnName: 'address', value: data.doc['Adress'] ?? ""),
    ]);
  }

  @override
  void initState() {
    super.initState();
    _dataGridController = DataGridController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildDataGrid(),
    );
  }
}
