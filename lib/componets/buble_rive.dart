import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveBubble extends StatefulWidget {
  @override
  _RiveBubbleState createState() => _RiveBubbleState();
}

class _RiveBubbleState extends State<RiveBubble>
    with SingleTickerProviderStateMixin {
  RuntimeArtboard _riveArtboard = RuntimeArtboard();
  RiveAnimationController _controller = SimpleAnimation('pingPong');

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    //load rive
    rootBundle.load('assets/rives/buble_pingpong_1.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);
        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        // Add a controller to play back a known animation on the main/default
        // artboard.We store a reference to it so we can toggle playback.
        artboard.addController(_controller);
        setState(() => _riveArtboard = artboard as RuntimeArtboard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Rive(artboard: _riveArtboard),
    );
  }
}
