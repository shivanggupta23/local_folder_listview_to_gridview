import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Widgets/FileListWidget.dart';
import 'VedioScreen.dart';
import 'package:file_picker/file_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showLogo = true;

  void _pickFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(allowMultiple: false);

      if (result == null) return;

      print(result.files.first.name);
      print(result.files.first.size);
      print(result.files.first.path);
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showLogo
            ? Text('Directories')
            : null, // Show/hide title based on the state
        leading: _showLogo
            ? null
            : IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  // Handle back arrow press to navigate to HomeScreen
                  setState(() {
                    _showLogo = true;
                  });
                },
              ),
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
        ],
      ),
      body: FileListWidget(
        onFileTap: () {
          setState(() {
            _showLogo = false;
          });
          try {
            _pickFile();
          } catch (e) {
            print('Error picking file: $e');
          }
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _showLogo ? 0 : 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => VideoScreen()),
            );
          }
        },
      ),
    );
  }

  Future<void> _launchFileExplorer() async {
    const url = 'content://com.android.externalstorage.documents/root/primary';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  CustomBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).appBarTheme.backgroundColor,
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue, // Set the selected item color
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Videos',
          ),
        ],
        onTap: onTap,
      ),
    );
  }
}
