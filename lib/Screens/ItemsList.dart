import 'package:flutter/material.dart';

class ItemsList extends StatefulWidget {
  var itemData;
  ItemsList({this.itemData});
  @override
  _ItemsListState createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  @override
  Widget build(BuildContext context) {
    print(widget.itemData);
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
