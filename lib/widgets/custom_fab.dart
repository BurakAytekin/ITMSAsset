import 'package:flutter/material.dart';
import 'package:information_technology/utilities/constants.dart';
import 'package:information_technology/widgets/custom_dropdown.dart';

class CustomFab extends StatefulWidget {
  final String label;

  CustomFab({this.label});

  @override
  _CustomFabState createState() => _CustomFabState();
}

class _CustomFabState extends State<CustomFab> {
  TextEditingController _textEditingController = TextEditingController();

  void _searchCategory() {
    List<String> items = ["Bilgisayar", "Araba"];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: kOrangeColor,
            title: new Text(
              "Hazır kategori seç",
              style: style,
            ),
            content: Container(
              width: double.maxFinite,
              height: 170,
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      '${items[index]}',
                      style: style,
                    ),
                    leading: Icon(Icons.add, color: Colors.white),
                    onTap: () {
                      setState(() {
                        _textEditingController.text = items[index];
                      });
                      Navigator.of(context).pop();
                    },
                  );
                },
              ),
            ),
            actions: <Widget>[
              new TextButton(
                child: new Text(
                  "Kapat",
                  style: style,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
      },
    );
  }

  Widget popUp() {
    return Material(
      color: kOrangeColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomDropdown(
              onSelectParam: (String param) {
                print("$param");
              },
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.2,
            ),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                focusColor: Colors.white,
                hintText: "Kategori yaz",
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _searchCategory();
                  },
                  color: Colors.white,
                ),
              ),
              cursorColor: Colors.white,
              style: TextStyle(color: Colors.white),
              maxLines: 2,
            ),
            const Divider(
              color: Colors.white,
              thickness: 0.2,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'EKLE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String label = widget.label;

    return FloatingActionButton.extended(
      backgroundColor: kOrangeColor,
      foregroundColor: Colors.black,
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => Center(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(height: 230, child: popUp()),
          )),
        );
      },
      icon: Icon(Icons.add, color: Colors.white),
      label: Text(
        '$label',
        style: style,
      ),
    );
  }
}
