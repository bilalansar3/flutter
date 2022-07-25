import 'package:first_app/models/catalog.dart';
import 'package:first_app/utilis/routes.dart';
import 'package:first_app/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:matcher/matcher.dart';
import 'dart:convert';
import '../models/catalog.dart';
import '../widgets/Drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  // loadData() async {
  //   final catalogJson = await rootBundle.loadString("catalog.json");
  //   final decodeData = jsonDecode(catalogJson);
  //   var productData = decodeData(decodeData);

  //   CatalogModel.items =
  //       List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
  //   setState(() {});
  // }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    final decodedData = jsonDecode(catalogJson);

    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bilal's 1st App"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? ListView.builder(
                  itemCount: CatalogModel.items.length,
                  itemBuilder: (context, index) {
                    return ItemWidget(
                      item: CatalogModel.items[index],
                    );
                  },
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: MyDrawer(),
    );
  }
}
