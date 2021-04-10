import 'package:floating_bubble/componets/background.dart';
import 'package:flutter/material.dart';

import 'body.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Background(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Body(),
          ),
        ),
      ],
    );
  }
}
