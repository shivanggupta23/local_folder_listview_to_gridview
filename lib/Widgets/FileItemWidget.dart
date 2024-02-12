import 'package:flutter/material.dart';

class FileItemWidget extends StatelessWidget {
  final int index;

  FileItemWidget({required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('File/Folder Name $index'),
      leading: Icon(Icons.folder, color: Colors.purple),
      onTap: () {},
    );
  }
}
