import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Employee {
  Employee(this.position, this.name, this.phoenno, this.address);

  ///
  String position;

  ///
  String name;

  ///
  String phoenno;

  ///
  String address;

  DataGridRow getDataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell<String>(columnName: 'position', value: position),
      DataGridCell<String>(columnName: 'name', value: name),
      DataGridCell<String>(columnName: 'phoenno', value: phoenno),
      DataGridCell<String>(columnName: 'address', value: address),
    ]);
  }
}