import 'package:flutter/material.dart';
import '../Widgets/VideoGridWidget.dart';
import '../Widgets/VideoTileWidget.dart';
import 'HomeScreen.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  int _currentIndex = 1; // Set the appropriate index for VideoScreen
  bool _isGridView = true; // Track the current view mode

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Videos'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.download),
            onPressed: () {
              // Implement download functionality
            },
          ),
          IconButton(
            icon: _isGridView ? Icon(Icons.list) : Icon(Icons.grid_on),
            onPressed: () {
              // Toggle between GridView and ListView
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
        ],
      ),
      body: _isGridView ? VideoGridWidget() : VideoListWidget(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            // The current screen is VideoScreen, no need to navigate
          }
        },
      ),
    );
  }
}

class VideoListWidget extends StatelessWidget {
  const VideoListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      separatorBuilder: (context, index) {
        // Add a gap of 8.0 between items
        return SizedBox(height: 80.0);
      },
      itemBuilder: (context, index) {
        return VideoTileWidget(index: index);
      },
    );
  }
}
