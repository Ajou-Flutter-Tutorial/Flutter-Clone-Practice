import 'package:flutter/material.dart';
import 'package:instagram_clone/root/domain/post.dart';
import 'package:instagram_clone/root/post_detail/post_detail_model.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    final model = postDetailModel();

    return Scaffold(
        appBar: AppBar(
          title: const Text('둘러보기'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(post.userName,
                          style: TextStyle(fontSize: 30)),
                      Text(post.userEmail)
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Hero(tag: post.id, child: Image.network(post.imageUrl)),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(post.title),
            ),
          ],
        ));
  }
}
