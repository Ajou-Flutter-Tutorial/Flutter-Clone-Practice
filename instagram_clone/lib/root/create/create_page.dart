import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_clone/root/create/create_model.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final model = CreateModel();

  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('새 게시물'),
        actions: [
          IconButton(
            onPressed: () async {
              if (_image != null && _titleController.text.isNotEmpty) {
                await model.uploadPost(_titleController.text, _image!);
                if (mounted) {
                  Navigator.pop(context);
                }
              }
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                filled: true,
                hintStyle: TextStyle(color: Colors.grey),
                hintText: '입력하세요',
                fillColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () async {
                _image = await model.getImage();

                setState(() {});
              },
              child: Text('이미지 업로드'),
            ),
            SizedBox(
              height: 20,
            ),
            if (_image != null)
              Image.file(
                _image!,
                width: 250,
              ),
          ],
        ),
      ),
    );
  }
}
