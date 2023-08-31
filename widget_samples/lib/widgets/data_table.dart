import 'package:flutter/material.dart';

import '../component/base_scaffold.dart';

class DataTableSample extends StatelessWidget {
  const DataTableSample({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: 'DataTable Sample',
      child: DataTable(
        columns: const [
          DataColumn(label: Text('Name')),
          DataColumn(label: Text('Age')),
          DataColumn(label: Text('Role')),
        ],
        rows: const [
          DataRow(
            cells: [
              DataCell(Text('Alice')),
              DataCell(Text('24')),
              DataCell(Text('Engineer')),
            ],
          ),
          DataRow(
            cells: [
              DataCell(Text('Bob')),
              DataCell(Text('27')),
              DataCell(Text('Designer')),
            ],
          ),
          // ... 他の行
        ],
      ),
    );
  }
}
