import 'package:flutter/material.dart';

import 'home_page.dart';

class NextPage extends StatefulWidget {
  final String label;
  NextPage(this.label);
  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.label),
        leading: IconButton(
          icon: Icon(
            Icons.navigate_before,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomePage(),
              ),
            );
          },
        ),
      ),
      body: Container(
        child: Text(widget.label),
      ),
    );
  }
}
