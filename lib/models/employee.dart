import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Employee {
  Employee( this.position, this.fname, this.name, this.phoenno, this.address, this.location,  );

  ///
  String position;

  ///
  String name;
  String fname;

  ///
  String phoenno;

  ///
  String address;
  String location;

  DataGridRow getDataGridRow() {
    return DataGridRow(cells: <DataGridCell>[
      DataGridCell<String>(columnName: 'position', value: position),
      DataGridCell<String>(columnName: 'name', value: name),
      DataGridCell<String>(columnName: 'fname', value: fname),
      DataGridCell<String>(columnName: 'phoenno', value: phoenno),
      DataGridCell<String>(columnName: 'address', value: address),
    ]);
  }
}
