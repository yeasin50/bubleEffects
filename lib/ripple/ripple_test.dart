import 'package:flutter/material.dart';

class RippleTest extends StatefulWidget {
  @override
  _RippleTestState createState() => _RippleTestState();
}

class _RippleTestState extends State<RippleTest> {
  double width = 200;
  double rippleWidth = 0;

  final GlobalKey _key = GlobalKey();

  double _leftPoss = 100;
  double _topPoss = 100;
  late double _top = 0, _left = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        key: _key,
        color: Colors.grey.withOpacity(.5),
        width: 300,
        height: 300,
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: Container(
                width: width,
                height: width,
                decoration: BoxDecoration(
                  // border: Border.all(width: 12),
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  print("tapped");
                  setState(() {});
                },
                onPanDown: (DragDownDetails details) {
                  print("local ${details.localPosition.toString()}");
                  print("global : ${details.localPosition.toString()}");

                  setState(() {
                    _leftPoss = details.localPosition.dx;
                    _topPoss = details.localPosition.dy;
                    _top = details.localPosition.dy;
                    _left = details.localPosition.dx;

                    rippleWidth = width;
                  });
                  print("left $_leftPoss top $_topPoss");
                },
              ),
            ),
            AnimatedPositioned(
              duration: Duration(milliseconds: 400),
              // height: rippleWidth,

              top: _topPoss - rippleWidth / 2,
              left: _leftPoss - rippleWidth / 2,
              onEnd: () {
                setState(() {
                  // _topPoss = _top 2;
                  // _leftPoss = _left - rippleWidth / 2;
                });
              },
              child: AnimatedContainer(
                onEnd: () {
                  setState(() {
                    rippleWidth = 0;
                  });
                },
                // alignment: Alignment.center,
                duration: Duration(milliseconds: 400),
                width: rippleWidth,
                height: rippleWidth,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: rippleWidth == 0 ? 0 : 3,
                    color: Colors.white,
                  ),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
