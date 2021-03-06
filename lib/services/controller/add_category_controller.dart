import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class AddCategoryApi {
  static Future<void> addCategoryWithAsset({
    @required String category,
    @required String assetCategory,
    @required String assetTitle,
  }) {
    print(category + " " + " " + assetCategory + " " + assetTitle);
    CollectionReference categories =
        FirebaseFirestore.instance.collection("categories");
    categories
        .doc("$category") //örn fiziksel
        .collection("asset_categories")
        .doc("$assetCategory") // örn bilgisayar
        .set({'title': "$assetCategory"}).then((value) {
      print("Success! Documentation added!");
      categories
          .doc("$category") //örn fiziksel
          .collection("asset_categories")
          .doc("$assetCategory") // örn bilgisayar
          .collection("asset_examples")
          .doc("$assetTitle")
          .set({"title": assetTitle})
          .then((value) => print("Success! Asset added! "))
          .catchError((onError) {
            print(onError);
          }); //örn macbook pro
    }).catchError((onError) {
      print(onError);
    });
  }

  static Future<List<DocumentSnapshot>> getCategories({@required category}) {
    CollectionReference categories =
        FirebaseFirestore.instance.collection("categories");

    return categories
        .doc("$category") //örn fiziksel
        .collection("asset_categories")
        .get()
        .then((snapshot) {
      return snapshot.docs;
    });
  }

  static Future<List<DocumentSnapshot>> getAssetCategory({@required category}) {
    CollectionReference categories =
        FirebaseFirestore.instance.collection("categories");
    return categories
        .doc("$category") //örn fiziksel
        .collection("asset_categories")
        .get()
        .then((snapshot) {
      return snapshot.docs;
    });
  }

  static Future<List<DocumentSnapshot>> getAssetCategoryExamples(
      {@required category, @required String assetCategory}) {
    CollectionReference categories =
        FirebaseFirestore.instance.collection("categories");
    return categories
        .doc("$category") //örn fiziksel
        .collection("asset_categories")
        .doc("$assetCategory")
        .collection("asset_examples")
        .get()
        .then((snapshot) {
      return snapshot.docs;
    });
  }

  static Future<void> addDijital(
  {@required title, @required name, @required startDate, @required endDate}) async {
    CollectionReference collection = FirebaseFirestore.instance.collection("categories");
    var snapshot = await collection.doc("Dijital").collection("asset_categories").doc("Lisans").collection("asset_examples").where("title", isEqualTo: title).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      snapshot.docs[0].reference.update({'use_by':name, 'use_end':endDate, 'use_start':startDate});
    }
  }

}
