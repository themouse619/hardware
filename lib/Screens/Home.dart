import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text('Items'),
              onPressed: () {
                Navigator.pushNamed(context, '/Items');
              },
            ),
            RaisedButton(
              child: Text('Accounts'),
              onPressed: () {
                Navigator.pushNamed(context, '/Accounts');
              },
            ),
          ],
        ),
      ),
    );
  }
}
