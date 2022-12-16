import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:voterrecord/models/employee.dart';


class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource(this._employees) {
    dataGridRows = _employees
        .map<DataGridRow>((dataGridRow) => dataGridRow.getDataGridRow())
        .toList();
  }

  List<Employee> _employees = [];

  List<DataGridRow> dataGridRows = [];

  /// Helps to hold the new value of all editable widget.
  /// Based on the new value we will commit the new value into the corresponding
  /// [DataGridCell] on [onSubmitCell] method.
  dynamic newCellValue;

  /// Help to control the editable text in [TextField] widget.
  TextEditingController editingController = TextEditingController();
  

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
          alignment: (dataGridCell.columnName == 'position' ||
                  dataGridCell.columnName == 'address')
              ? Alignment.centerRight
              : Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            dataGridCell.value.toString(),
            overflow: TextOverflow.ellipsis,
          ));
    }).toList());
  }
  void updateDataGridSource() {
    notifyListeners();
  }
  @override
  // void onCellSubmit(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex,
  //     GridColumn column) {
       
  //   final dynamic oldValue = dataGridRow
  //           .getCells()
  //           .firstWhereOrNull((DataGridCell dataGridCell) =>
  //               dataGridCell.columnName == column.columnName)
  //           ?.value ??
  //       '';

  //   final int dataRowIndex = dataGridRows.indexOf(dataGridRow);

  //   if (newCellValue == null || oldValue == newCellValue) {
  //     return;
  //   }

  //   if (column.columnName == 'position') {
  //     dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
  //         DataGridCell<int>(columnName: 'position', value: newCellValue);
  //     _employees[dataRowIndex].position = newCellValue;
  //   } else if (column.columnName == 'name') {
  //     dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
  //         DataGridCell<String>(columnName: 'name', value: newCellValue);
  //     _employees[dataRowIndex].name = newCellValue.toString();
  //   } else if (column.columnName == 'phoenno') {
  //     dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
  //         DataGridCell<String>(columnName: 'phoenno', value: newCellValue);
  //     _employees[dataRowIndex].phoenno = newCellValue.toString();
  //   } else {
  //     dataGridRows[dataRowIndex].getCells()[rowColumnIndex.columnIndex] =
  //         DataGridCell<int>(columnName: 'address', value: newCellValue);
  //     _employees[dataRowIndex].address = newCellValue;
  //   }
  // }

  @override
  bool canSubmitCell(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex,
      GridColumn column) {
    // Return false, to retain in edit mode.
    return true; // or super.canSubmitCell(dataGridRow, rowColumnIndex, column);
  }

  @override
  Widget? buildEditWidget(DataGridRow dataGridRow, RowColumnIndex rowColumnIndex, GridColumn column, CellSubmit submitCell) 
      {
    // Text going to display on editable widget
    final String displayText = dataGridRow
            .getCells()
            .firstWhereOrNull((DataGridCell dataGridCell) =>
                dataGridCell.columnName == column.columnName)
            ?.value
            ?.toString() ??
        '';

    // The new cell value must be reset.
    // To avoid committing the [DataGridCell] value that was previously edited
    // into the current non-modified [DataGridCell].
    newCellValue = null;

    
    // Holds regular expression pattern based on the column type.
    // final RegExp regExp = _getRegExp(isNumericType, column.columnName);

    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.centerLeft,
      child: TextField(
        autofocus: true,
        controller: editingController..text = displayText,
        textAlign:  TextAlign.left,
        autocorrect: false,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 16.0),
        ),
       
        keyboardType: TextInputType.text,
        onChanged: (String value) {
          if (value.isNotEmpty) {
          
              newCellValue = value;
            
          } else {
            newCellValue = null;
          }
        },
        onSubmitted: (String value) {
          /// Call [CellSubmit] callback to fire the canSubmitCell and
          /// onCellSubmit to commit the new value in single place.
           FirebaseFirestore.instance.collection('Employees').doc('Ck4gEtJARoTOdIZ0XQet').update({'Name': value});
         
        },
      ),
    );
  }

  // RegExp _getRegExp(bool isNumericKeyBoard, String columnName) {
  //   return isNumericKeyBoard ? RegExp('[0-9]') : RegExp('[a-zA-Z ]');
  // }
}
