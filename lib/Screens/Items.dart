import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hardware/Common/Services.dart';
import 'package:hardware/Screens/ItemsList.dart';

class Items extends StatefulWidget {
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  bool isLoading = false;
  TextEditingController items = new TextEditingController();

  List itemdata;

  getItems() async {
    try {
      final result = await InternetAddress.lookup('google.com');

      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        var data = {
          "company_code": "ITFUT",
          "company_year": "2021",
          "input": items.text.toString(),
        };
        Future res = Services.item(data);
        setState(() {
          isLoading = true;
        });
        res.then((data) async {
          if (data != null && data.length > 0) {
            setState(() {
              itemdata = data;
              print("itemdata:${itemdata}");
            });
          } else {
            setState(() {
              isLoading = false;
            });
            showMsg("Data Not Found");
          }
        }, onError: (e) {
          setState(() {
            isLoading = false;
          });
          print("Error : Item Data $e");
          showMsg("$e");
        });
      } else {
        showMsg("Something went wrong");
      }
    } on SocketException catch (_) {
      showMsg("No Internet Connection.");
    }
  }

  showMsg(String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text(msg),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text(
                "Close",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: items,
                ),
              ),
              FlatButton(
                color: Colors.cyan,
                child: Text('Search'),
                onPressed: () {
                  getItems();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ItemsList(
                              itemData: itemdata,
                            )),
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
