import 'package:flutter/material.dart';
import '../utilities/constants.dart';

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
      dropdownColor: kOrangeColor,
      icon: Icon(Icons.arrow_drop_down, color: Colors.white),
      isExpanded: true,
      underline: SizedBox(),
      value: dropdownValue,
      items: <DropdownMenuItem>[
        DropdownMenuItem(
          value: 'Fiziksel',
          child: Text(
            'Fiziksel',
            style: style,
          ),
        ),
        DropdownMenuItem(
          value: 'Dijital',
          child: Text(
            'Dijital',
            style: style,
          ),
        ),
        DropdownMenuItem(
          value: 'İnsan kaynağı',
          child: Text(
            'İnsan kaynağı',
            style: style,
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
