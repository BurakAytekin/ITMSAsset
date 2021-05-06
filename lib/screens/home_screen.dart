import 'package:flutter/material.dart';

import '../widgets/custom_fab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                Tab(child: Text("Fiziksel")),
                Tab(child: Text("Dijital")),
                Tab(child: Text("İnsan Kaynağı"))
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new StuffInTiles(categoryList[index]);
                },
                itemCount: categoryList.length,
              ),
              Container(
                child: Text("tab2"),
              ),
              Container(
                child: Text("tab3"),
              )
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
      if (t.assetList.isEmpty)
        return ListTile(title: Text(t.title));

      return ExpansionTile(
        key: PageStorageKey<int>(3),
        title: Text(t.title),
        children: t.assetList.map(_buildTiles).toList(),
      );
    } else {
      return ListTile(
          title: Text(t.title),
          trailing: Icon(Icons.edit));
    }
  }
}


class AssetCategory {
  String title;
  bool isExpanded;
  List<AssetCategory> assetList;
  AssetCategory({ this.title, this.isExpanded, this.assetList });
}


class Asset {
  String name;
  String description;
  Asset({ this.name, this.description });
}

List<AssetCategory> categoryList = [
  AssetCategory(title: "Bilgisayar", isExpanded: false, assetList: [
    AssetCategory(title: "Bilgisayar 1")
  ]),
  AssetCategory(title: "Sunucu", isExpanded: false, assetList: [
    AssetCategory(title: "Bilgisayar 1",)
  ]),
  AssetCategory(title: "Yazıcı", isExpanded: false, assetList: [
  ]),
];