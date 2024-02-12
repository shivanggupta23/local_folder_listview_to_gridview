import 'package:flutter/material.dart';

import 'VideoTileWidget.dart';

class VideoGridWidget extends StatelessWidget {
  const VideoGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return VideoTileWidget(index: index);
      },
    );
  }
}
