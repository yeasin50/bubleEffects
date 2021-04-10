import 'dart:async';
import 'package:floating_bubble/try/components/buble_paint.dart';
import 'package:flutter/material.dart';

import 'pos_4v.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final double _radius = 200;
  late Timer timer;

  late var _rectPoss;
  @override
  void initState() {
    super.initState();
    _rectPoss = RectPos(
      0,
      0,
      _radius - 20,
      _radius - 20,
    );
    timer = Timer.periodic(Duration(milliseconds: 200), frameBuilder);
  }

  frameBuilder(Timer timer) async {
    _rectPoss.x += 10;
    _rectPoss.y += 10;

    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  _handleAnim() {
    setState(() {
      timer.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          onPressed: _handleAnim,
          child: Text("Start/stop"),
        ),
        Center(
          child: Container(
            width: _radius,
            height: _radius,
            color: Colors.blue.withOpacity(.5),
            child: CustomPaint(
              foregroundPainter: BubblePainter(
                  color: Colors.green,
                  rect: Rect.fromLTRB(
                    _rectPoss.x,
                    _rectPoss.y,
                    _rectPoss.w,
                    _rectPoss.h,
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
