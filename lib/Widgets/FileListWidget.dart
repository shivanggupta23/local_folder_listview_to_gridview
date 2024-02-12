import 'package:flutter/material.dart';
import 'FileItemWidget.dart';

class FileListWidget extends StatefulWidget {
  final VoidCallback onFileTap;

  const FileListWidget({required this.onFileTap});

  @override
  _FileListWidgetState createState() => _FileListWidgetState();
}

class _FileListWidgetState extends State<FileListWidget> {
  bool isGridView = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Directories',
                style: TextStyle(fontSize: 18.0),
              ),
              IconButton(
                icon: Icon(isGridView ? Icons.list : Icons.grid_on),
                onPressed: () {
                  setState(() {
                    isGridView = !isGridView;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: isGridView
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        widget.onFileTap(); // Trigger the onFileTap callback
                      },
                      child: FileItemWidget(index: index),
                    );
                  },
                )
              : ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        widget.onFileTap(); // Trigger the onFileTap callback
                      },
                      child: FileItemWidget(index: index),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
