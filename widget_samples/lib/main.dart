import 'package:flutter/material.dart';
import 'package:widget_samples/widgets/alert_dialog.dart';
import 'package:widget_samples/widgets/bottom_navigation_bar.dart';
import 'package:widget_samples/widgets/card.dart';
import 'package:widget_samples/widgets/chip.dart';
import 'package:widget_samples/widgets/column.dart';
import 'package:widget_samples/widgets/data_table.dart';
import 'package:widget_samples/widgets/divider.dart';
import 'package:widget_samples/widgets/drawer.dart';
import 'package:widget_samples/widgets/drop_down.dart';
import 'package:widget_samples/widgets/elevated_button.dart';
import 'package:widget_samples/widgets/floating_action_button.dart';
import 'package:widget_samples/widgets/grid_view.dart';
import 'package:widget_samples/widgets/icon.dart';
import 'package:widget_samples/widgets/image.dart';
import 'package:widget_samples/widgets/list_tile.dart';
import 'package:widget_samples/widgets/list_view.dart';
import 'package:widget_samples/widgets/popup_menu_button.dart';
import 'package:widget_samples/widgets/row.dart';
import 'package:widget_samples/widgets/stack_positioned.dart';
import 'package:widget_samples/widgets/tab_bar.dart';
import 'package:widget_samples/widgets/tooltip.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets Sample',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 42, 42, 247)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Widgets Sample List'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: CustomScrollView(
          slivers: [
            _NavigatorButton(label: 'Column', page: ColumnSample()),
            _NavigatorButton(label: 'Row', page: RowSample()),
            _NavigatorButton(
                label: 'Stack & Positioned', page: StackAndPositionedSample()),
            _NavigatorButton(label: 'ListView', page: ListViewSample()),
            _NavigatorButton(label: 'GridView', page: GridViewSample()),
            _NavigatorButton(label: 'ListTile', page: ListTileSample()),
            _NavigatorButton(
                label: 'ElevatedButton', page: ElevatedButtonSample()),
            _NavigatorButton(
                label: 'FloatingActionButton',
                page: FloatingActionButtonSample()),
            _NavigatorButton(label: 'DropDown', page: DropDownSample()),
            _NavigatorButton(
                label: 'PopupMenuButton', page: PopupMenuButtonSample()),
            _NavigatorButton(label: 'AlertDialog', page: AlertDialogSample()),
            _NavigatorButton(
                label: 'Bottom Navigation Bar',
                page: BottomNavigationBarSample()),
            _NavigatorButton(label: 'TabBar', page: TabBarSample()),
            _NavigatorButton(label: 'Drawer', page: DrawerSample()),
            _NavigatorButton(label: 'Tooltip', page: ToolTipSample()),
            _NavigatorButton(label: 'Card', page: CardSample()),
            _NavigatorButton(label: 'DataTable', page: DataTableSample()),
            _NavigatorButton(label: 'Image', page: ImageSample()),
            _NavigatorButton(label: 'Icon', page: IconSample()),
            _NavigatorButton(label: 'Chip', page: ChipSample()),
            _NavigatorButton(label: 'Divider', page: DividerSample()),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _NavigatorButton extends StatelessWidget {
  const _NavigatorButton({
    required this.page,
    required this.label,
  });

  final Widget page;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 60,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(vertical: 6),
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8),
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => page,
              ),
            );
          },
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w400,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
