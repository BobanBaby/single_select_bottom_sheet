import 'package:bottom_sheet_selectable_list/single_select_bottom_sheet.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String value = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text(value),
              ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => SingleSelectBottomSheet(
                        title: 'Test',
                        list: [
                          SingleSelectBottomSheetModel(title: 'Test 1', value: 'Value 1'),
                          SingleSelectBottomSheetModel(title: 'Test 2', value: 'Value 2'),
                          SingleSelectBottomSheetModel(title: 'Test 1', value: 'Value 1'),
                          SingleSelectBottomSheetModel(title: 'Test 2', value: 'Value 2'),
                          SingleSelectBottomSheetModel(title: 'Test 1', value: 'Value 1'),
                          SingleSelectBottomSheetModel(title: 'Test 2', value: 'Value 2'),
                          SingleSelectBottomSheetModel(title: 'Test 1', value: 'Value 1'),
                          SingleSelectBottomSheetModel(title: 'Test 2', value: 'Value 2'),
                        ],
                        selectCallBack: (String selectedItem) {},
                        doneCallBack: (String? selectedItem) {
                          Navigator.of(context).pop();
                          if (selectedItem != null)
                            setState(() {
                              value = selectedItem;
                            });
                        },
                        isRadioButton: true,
                        enableDoneButton: true,
                      ),
                    );
                  },
                  child: Text('Bottom Sheet demo'))
            ],
          ),
        ),
      ),
    );
  }
}
