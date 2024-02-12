import 'package:flutter/material.dart';

class VideoTileWidget extends StatelessWidget {
  final int index;

  VideoTileWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement action when a video tile is tapped
      },
      child: Container(
        color: Colors.grey,
        child: Center(
          child: Text('Video $index'),
        ),
      ),
    );
  }
}
