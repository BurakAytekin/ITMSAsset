import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:information_technology/services/controller/add_category_controller.dart';
import 'package:information_technology/widgets/custom_dropdown.dart';

class CustomDialog extends StatefulWidget {
  final String label;

  CustomDialog({this.label});

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  TextEditingController _textEditingController = TextEditingController();
  TextEditingController _assetTextEditingController = TextEditingController();
  FocusNode focusNodeCategory;
  FocusNode focusNodeAsset;
  String mainAsset = "İnsan kaynağı";

  @override
  void initState() {
    super.initState();
    focusNodeCategory = FocusNode();
    focusNodeAsset = FocusNode();
  }

  void _searchCategory() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: new Text(
              "Zimmetlemek istenilen kişiyi seç",
              style: TextStyle(color: Colors.black),
            ),
            content: Container(
                width: double.maxFinite,
                height: 260,
                child: FutureBuilder<List<DocumentSnapshot>>(
                  future: AddCategoryApi.getAssetCategoryExamples(category: mainAsset, assetCategory: "maddi"),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        if (snapshot.hasError || snapshot.data.isEmpty) {
                          print(snapshot.error);
                          return Container(
                            child: Text("Bulunamadı"),
                          );
                        } else {
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(
                                  '${snapshot.data[index].get("name")}',
                                  style: TextStyle(color: Colors.black),
                                ),
                                leading: Icon(Icons.add, color: Colors.black),
                                onTap: () {
                                  setState(() {
                                    _textEditingController.text =
                                        snapshot.data[index].get("name");
                                  });
                                  Navigator.of(context).pop();
                                },
                              );
                            },
                          );
                        }
                    }
                  },
                )),
            actions: <Widget>[
              new TextButton(
                child: new Text(
                  "Kapat",
                  style: TextStyle(color: Colors.black),
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

  Widget popUp(Function setState) {
    return Material(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
            TextField(
              controller: _textEditingController,
              focusNode: focusNodeCategory,
              onTap: () {
                setState(() {});
              },
              showCursor:
              MediaQuery.of(context).viewInsets.bottom != 0 ? true : false,
              decoration: InputDecoration(
                focusColor: Colors.black,
                hintText: "Zimmetlemek istediğiniz kişi",
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _searchCategory();
                  },
                  color: Colors.black,
                ),
              ),
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            const Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
            TextField(
              controller: _textEditingController,
              focusNode: focusNodeCategory,
              onTap: () {
                setState(() {});
              },
              showCursor:
              MediaQuery.of(context).viewInsets.bottom != 0 ? true : false,
              decoration: InputDecoration(
                focusColor: Colors.black,
                hintText: "Kimin tarafından zimmetlendiği",
                border: InputBorder.none,
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    _searchCategory();
                  },
                  color: Colors.black,
                ),
              ),
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            const Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
            TextField(
              onTap: () {
                setState(() {});
              },
              showCursor:
              MediaQuery.of(context).viewInsets.bottom != 0 ? true : false,
              controller: _assetTextEditingController,
              focusNode: focusNodeAsset,
              decoration: InputDecoration(
                focusColor: Colors.black,
                hintText: "Başlangıç tarihi giriniz",
                border: InputBorder.none,
              ),
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            const Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
            TextField(
              onTap: () {
                setState(() {});
              },
              showCursor:
              MediaQuery.of(context).viewInsets.bottom != 0 ? true : false,
              controller: _assetTextEditingController,
              focusNode: focusNodeAsset,
              decoration: InputDecoration(
                focusColor: Colors.black,
                hintText: "Bitiş tarihi giriniz",
                border: InputBorder.none,
              ),
              cursorColor: Colors.black,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            const Divider(
              color: Colors.black,
              thickness: 0.2,
            ),
            TextButton(
              onPressed: () async {
                AddCategoryApi.addCategoryWithAsset(
                    category: mainAsset,
                    assetCategory: _textEditingController.text,
                    assetTitle: _assetTextEditingController.text);
                Navigator.of(context).pop();
              },
              child: const Text(
                'ZİMMETLE',
                style: TextStyle(color: Colors.black),
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
      backgroundColor: Colors.blue,
      foregroundColor: Colors.black,
      onPressed: () {
        showDialog(
          context: context,
          builder: (_) => StatefulBuilder(builder: (context, setState) {
            return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                      margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom != 0
                              ? 230
                              : 0),
                      height: 410,
                      child: popUp(setState)),
                ));
          }),
        );
      },
      icon: Icon(Icons.add, color: Colors.white),
      label: Text(
        '$label',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
