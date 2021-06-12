import 'package:flutter/material.dart';

class SingleSelectBottomSheet extends StatefulWidget {
  final String title;
  final List<SingleSelectBottomSheetModel> list;
  final Color? color;
  final isRadioButton;
  final bool enableDoneButton;
  final selectedValue;
  final Function selectCallBack;
  final Function? doneCallBack;

  SingleSelectBottomSheet(
      {required this.title,
      required this.list,
      this.color,
      required this.selectCallBack,
      this.doneCallBack,
      this.isRadioButton = false,
      this.enableDoneButton = false,
      this.selectedValue});

  @override
  _SingleSelectBottomSheetState createState() => _SingleSelectBottomSheetState();
}

class _SingleSelectBottomSheetState extends State<SingleSelectBottomSheet> {
  var selectedValue;
  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Padding(
          padding: EdgeInsets.only(top: 10),
          child: Container(
            height: 6.0,
            width: 60,
            decoration: BoxDecoration(
                color: Color(0xffdfe6e8), borderRadius: BorderRadius.all(Radius.circular(8.0))),
          )),
      Padding(
        padding: EdgeInsets.only(top: 15),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.title,
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 0.72, height: 1.22),
              ),
            ),
          ),
          widget.enableDoneButton
              ? TextButton(
                  onPressed: () {
                    widget.doneCallBack!.call(selectedValue);
                  },
                  child: Text('Done'))
              : Container()
        ],
      ),
      SingleSelectBottomSheetListParent(
        isLargeList: widget.list.length > 5,
        child: Column(
          children: [
            ...widget.list
                .map((singleSelectBottomSheetItem) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                      child: Material(
                        borderRadius: BorderRadius.all(
                          Radius.circular(4.0),
                        ),
                        color: (singleSelectBottomSheetItem.value == selectedValue)
                            ? Color(0xffdfe6e8)
                            : Color(0xfff6f8f9),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedValue = singleSelectBottomSheetItem.value;
                            });
                            widget.selectCallBack.call(selectedValue);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4.0),
                              ),
                            ),
                            child: widget.isRadioButton
                                ? RadioListTile(
                                    title: Text(
                                      singleSelectBottomSheetItem.title,
                                      style: TextStyle(
                                        color: Color(0xff151b26),
                                        fontSize: 16,
                                      ),
                                    ),
                                    groupValue: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value;
                                      });
                                      widget.selectCallBack.call(selectedValue);
                                    },
                                    value: singleSelectBottomSheetItem,
                                    activeColor: Colors.lightGreen,
                                  )
                                : ListTile(
                                    title: Text(
                                      singleSelectBottomSheetItem.title,
                                      style: TextStyle(
                                        color: Color(0xff151b26),
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ))
                .toList()
          ],
        ),
      )
    ]);
  }
}

class SingleSelectBottomSheetListParent extends StatelessWidget {
  final Widget child;
  final bool isLargeList;
  SingleSelectBottomSheetListParent({required this.child, this.isLargeList = false});

  Widget build(BuildContext context) {
    if (!isLargeList) return child;

    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }
}

class SingleSelectBottomSheetModel {
  String title;
  var value;
  SingleSelectBottomSheetModel({
    required this.title,
    required this.value,
  });
}
