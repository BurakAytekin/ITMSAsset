import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:information_technology/services/controller/add_category_controller.dart';

import '../widgets/custom_fab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> categories = ["Fiziksel", "Dijital", "İnsan Kaynağı"];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("ITMS ASSETS"),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(child: Text("${categories[0]}")),
              Tab(child: Text("${categories[1]}")),
              Tab(child: Text("${categories[2]}"))
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FutureBuilder<List<DocumentSnapshot>>(
              future: AddCategoryApi.getAssetCategory(category: "Fiziksel"),
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
                          return ExpansionTile(
                            onExpansionChanged: (bool changed) {
                              if (changed) {}
                            },
                            title: Text(
                              "${snapshot.data[index].get("title")}",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            children: <Widget>[
                              FutureBuilder<List<DocumentSnapshot>>(
                                future: AddCategoryApi.getAssetCategoryExamples(
                                    category: "Fiziksel",
                                    assetCategory:
                                    snapshot.data[index].get("title")),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return Center(
                                          child: CircularProgressIndicator());
                                    default:
                                      if (snapshot.hasError ||
                                          snapshot.data.isEmpty) {
                                        print(snapshot.error);
                                        return Container(
                                          child: Text("Bulunamadı"),
                                        );
                                      } else {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              onTap: () {
                                                Navigator.pushNamed(context, "/detail", arguments: {
                                                  "title": snapshot.data[index].get("title") ?? "",
                                                  "purchase_date": snapshot.data[index].get("purchase_date") ?? "",
                                                  "price": snapshot.data[index].get("price") ?? "",
                                                  "spec": snapshot.data[index].get("spec") ?? "",
                                                  "warranty_year": snapshot.data[index].get("warranty_year") ?? "",
                                                  "debt_by": snapshot.data[index].get("debt_by") ?? "",
                                                  "debt_end": snapshot.data[index].get("debt_end") ?? "",
                                                  "debt_start": snapshot.data[index].get("debt_start") ?? "",
                                                  "debt": snapshot.data[index].get("debt") ?? "",
                                                });
                                              },
                                              title: Text(
                                                '${snapshot.data[index].get("title")}',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              leading: Icon(Icons.add,
                                                  color: Colors.black),
                                            );
                                          },
                                        );
                                      }
                                  }
                                },
                              )
                            ],
                          );
                        },
                      );
                    }
                }
              },
            ),
            FutureBuilder<List<DocumentSnapshot>>(
              future: AddCategoryApi.getAssetCategory(category: "Dijital"),
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
                          return ExpansionTile(
                            onExpansionChanged: (bool changed) {
                              if (changed) {}
                            },
                            title: Text(
                              "${snapshot.data[index].get("title")}",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            children: <Widget>[
                              FutureBuilder<List<DocumentSnapshot>>(
                                future: AddCategoryApi.getAssetCategoryExamples(
                                    category: "Dijital",
                                    assetCategory:
                                    snapshot.data[index].get("title")),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return Center(
                                          child: CircularProgressIndicator());
                                    default:
                                      if (snapshot.hasError ||
                                          snapshot.data.isEmpty) {
                                        print(snapshot.error);
                                        return Container(
                                          child: Text("Bulunamadı"),
                                        );
                                      } else {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              onTap: () {
                                                Navigator.pushNamed(context, "/detail", arguments: {
                                                  "title": snapshot.data[index].get("title") ?? "",
                                                  "purchase_date": snapshot.data[index].get("purchase_date") ?? "",
                                                  "end_date": snapshot.data[index].get("end_date") ?? "",
                                                  "price": snapshot.data[index].get("price") ?? "",
                                                  "spec": snapshot.data[index].get("spec") ?? "",
                                                  "brand": snapshot.data[index].get("brand") ?? "",
                                                  "use_by": snapshot.data[index].get("use_by") ?? "",
                                                  "use_end": snapshot.data[index].get("use_end") ?? "",
                                                  "use_start": snapshot.data[index].get("use_start") ?? "",
                                                });
                                              },
                                              title: Text(
                                                '${snapshot.data[index].get("title")}',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              leading: Icon(Icons.add,
                                                  color: Colors.black),
                                            );
                                          },
                                        );
                                      }
                                  }
                                },
                              )
                            ],
                          );
                        },
                      );
                    }
                }
              },
            ),
            FutureBuilder<List<DocumentSnapshot>>(
              future:
              AddCategoryApi.getAssetCategory(category: "İnsan kaynağı"),
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
                          return ExpansionTile(
                            onExpansionChanged: (bool changed) {
                              if (changed) {}
                            },
                            title: Text(
                              "${snapshot.data[index].get("title")}",
                              style: TextStyle(fontSize: 18.0),
                            ),
                            children: <Widget>[
                              FutureBuilder<List<DocumentSnapshot>>(
                                future: AddCategoryApi.getAssetCategoryExamples(
                                    category: "İnsan kaynağı",
                                    assetCategory:
                                    snapshot.data[index].get("title")),
                                builder: (context, snapshot) {
                                  switch (snapshot.connectionState) {
                                    case ConnectionState.waiting:
                                      return Center(
                                          child: CircularProgressIndicator());
                                    default:
                                      if (snapshot.hasError ||
                                          snapshot.data.isEmpty) {
                                        print(snapshot.error);
                                        return Container(
                                          child: Text("Bulunamadı"),
                                        );
                                      } else {
                                        return ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: snapshot.data.length,
                                          itemBuilder: (context, index) {
                                            return ListTile(
                                              onTap: () {
                                                Navigator.pushNamed(context, "/detail", arguments: {
                                                  "title": snapshot.data[index].get("title") ?? "",
                                                  "name": snapshot.data[index].get("name") ?? "",
                                                  "age": snapshot.data[index].get("age") ?? "",
                                                  "birth_date": snapshot.data[index].get("birth_date") ?? "",
                                                  "department": snapshot.data[index].get("department") ?? "",
                                                  "salary": snapshot.data[index].get("salary") ?? "",
                                                  "spec": snapshot.data[index].get("spec") ?? "",
                                                });
                                              },
                                              title: Text(
                                                '${snapshot.data[index].get("title")}',
                                                style: TextStyle(
                                                    color: Colors.black),
                                              ),
                                              leading: Icon(Icons.add,
                                                  color: Colors.black),
                                            );
                                          },
                                        );
                                      }
                                  }
                                },
                              )
                            ],
                          );
                        },
                      );
                    }
                }
              },
            ),
          ],
        ),
        floatingActionButton: CustomFab(
          label: "EKLE",
        ),
      ),
    );
  }
}

class StuffInTiles extends StatelessWidget {
  final AssetCategory myTile;
  StuffInTiles(this.myTile);

  @override
  Widget build(BuildContext context) {
    return _buildTiles(myTile);
  }

  Widget _buildTiles(AssetCategory t) {
    if (t.assetList != null) {
      if (t.assetList.isEmpty) return ListTile(title: Text(t.title));

      return ExpansionTile(
        key: PageStorageKey<int>(3),
        title: Text(t.title),
        children: t.assetList.map(_buildTiles).toList(),
      );
    } else {
      return ListTile(title: Text(t.title), trailing: Icon(Icons.edit));
    }
  }
}

class AssetCategory {
  String title;
  bool isExpanded;
  List<AssetCategory> assetList;
  AssetCategory({this.title, this.isExpanded, this.assetList});
}

class Asset {
  String name;
  String description;
  Asset({this.name, this.description});
}

List<AssetCategory> categoryList = [
  AssetCategory(
      title: "Bilgisayar",
      isExpanded: false,
      assetList: [AssetCategory(title: "Bilgisayar 1")]),
  AssetCategory(title: "Sunucu", isExpanded: false, assetList: [
    AssetCategory(
      title: "Bilgisayar 1",
    )
  ]),
  AssetCategory(title: "Yazıcı", isExpanded: false, assetList: []),
];