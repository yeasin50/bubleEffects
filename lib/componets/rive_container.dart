import 'package:floating_bubble/next_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'buble_rive.dart';

class RiveContainer extends StatefulWidget {
  final double angle;
  final String label;
  final double width;
  RiveContainer({
    required this.width,
    required this.label,
    required this.angle,
  });

  @override
  _RiveContainerState createState() => _RiveContainerState();
}

class _RiveContainerState extends State<RiveContainer> {
  /// container Expansion after click
  late double _containerSize = widget.width;

  late double _width = widget.width;

  double rippleWidth = 0;
  double _leftPoss = 100;
  double _topPoss = 100;
  Color _rippleColor = Colors.white.withOpacity(.7);

  _push(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => NextPage(widget.label),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = 2200;
    return AnimatedContainer(
      duration: Duration(milliseconds: 600),
      width: _containerSize,
      height: _containerSize,
      onEnd: () {
        _push(context);
      },
      child: Stack(
        children: [
          ///`bubble`
          Transform.rotate(
            angle: widget.angle,
            child: RiveBubble(),
          ),

          ///`label`
          Center(
            child: Padding(
              padding: EdgeInsets.all(_width * .2),
              child: FittedBox(
                child: Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cabin(
                    fontSize: height,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          ///`On Tap event handler, dont need center widget`
          Center(
            child: GestureDetector(
              onTap: () {
                // print("tapped");
                // setState(() {});
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (_) => NextPage()));
              },
              onPanDown: (DragDownDetails details) {
                // print("local ${details.localPosition.toString()}");
                // print("global : ${details.localPosition.toString()}");

                /// setting the ripple effects
                setState(() {
                  _leftPoss = details.localPosition.dx;
                  _topPoss = details.localPosition.dy;
                  rippleWidth = _width;

                  _containerSize = height;
                });

                /// we may wait and then push

                // print("left $_leftPoss top $_topPoss");
              },
            ),
          ),

          ////`ripple effect` im not satisfy being loopback,=> use custom paint
          // buildRipple(context),
        ],
      ),
    );
  }

  AnimatedPositioned buildRipple(BuildContext context) {
    return AnimatedPositioned(
      duration: Duration(milliseconds: 400),
      // height: rippleWidth,

      top: _topPoss,
      left: _leftPoss,
      onEnd: () {
        setState(() {
          _containerSize = _width;
        });
      },
      child: AnimatedContainer(
        onEnd: () {
          print("EOF animated Container");
          setState(() {
            rippleWidth = 0;
          });

          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(
          //     builder: (_) => NextPage(widget.label),
          //   ),
          // );
        },
        // alignment: Alignment.center,
        duration: Duration(milliseconds: 400),
        width: rippleWidth,
        height: rippleWidth,
        decoration: BoxDecoration(
          border: Border.all(
            width: rippleWidth == 0 ? 0 : 4,
            color: _rippleColor,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
