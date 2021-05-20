import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final Function(String) onSelectParam;

  CustomDropdown({this.onSelectParam});

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String dropdownValue = 'Fiziksel';

  @override
  Widget build(BuildContext context) {
    Function(String) onSelectParam = widget.onSelectParam;
    return DropdownButton(
      dropdownColor: Colors.white,
      icon: Icon(Icons.arrow_drop_down, color: Colors.black),
      isExpanded: true,
      underline: SizedBox(),
      value: dropdownValue,
      style: TextStyle(color: Colors.black),
      focusColor: Colors.black,
      items: <DropdownMenuItem>[
        DropdownMenuItem(
          value: 'Fiziksel',
          child: Text(
            'Fiziksel',
            style: TextStyle(color: Colors.black),
          ),
        ),
        DropdownMenuItem(
          value: 'Dijital',
          child: Text(
            'Dijital',
            style: TextStyle(color: Colors.black),
          ),
        ),
        DropdownMenuItem(
          value: 'İnsan kaynağı',
          child: Text(
            'İnsan kaynağı',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          dropdownValue = value;
        });
        onSelectParam(value);
      },
    );
  }
}
