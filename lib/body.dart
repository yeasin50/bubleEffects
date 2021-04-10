import 'package:floating_bubble/componets/rive_container.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<String> _labels = ["Money", "Honey", "Bunny"];
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: RiveContainer(width: 440, label: _labels[0], angle: 12),
          ),
          Align(
            alignment: Alignment(0, 0),
            child: RiveContainer(width: 250, label: _labels[1], angle: 90),
          ),
          Align(
            alignment: Alignment(.5, .8),
            child: RiveContainer(width: 120, label: _labels[2], angle: 190),
          ),
          Positioned(
            left: -70,
            top: 150,
            child: RiveContainer(width: 120, label: _labels[2], angle: 190),
          ),
        ],
      );
    });
  }
}
