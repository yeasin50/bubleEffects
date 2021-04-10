import 'package:flutter/material.dart';

import 'ripple_paint.dart';

class RippleBody extends StatefulWidget {
  @override
  _RippleBodyState createState() => _RippleBodyState();
}

class _RippleBodyState extends State<RippleBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    animation = Tween<double>(begin: 10.0, end: 200.0).animate(_controller)
      ..addListener(() {
        setState(() {
          // print("repaint");
        });
      });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    print(animation.value);
    return Center(
        child: Container(
      width: 200,
      height: 200,
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: 200,
        
        ),
      ),
    ));
  }
}
