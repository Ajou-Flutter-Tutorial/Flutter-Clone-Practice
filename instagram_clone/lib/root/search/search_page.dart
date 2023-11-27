import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/root/post_detail/post_detail.dart';
import 'package:instagram_clone/root/search/search_model.dart';

import '../create/create_page.dart';
import '../domain/post.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = SearchModel();

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CreatePage()),
            );
          },
          child: Icon(Icons.create),
        ),
        appBar: AppBar(
          title: Text(
            'Instagram Clone',
            style: GoogleFonts.pacifico(fontSize: 20),
          ),
        ),
        body: StreamBuilder<QuerySnapshot<Post>>(
            stream: model.postsStream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const Text('알 수 없는 에러');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              List<Post> posts =
                  snapshot.data!.docs.map((post) => post.data()).toList();

              return GridView.builder(
                  itemCount: posts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 2.0,
                      crossAxisSpacing: 2.0),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PostDetailPage(post: posts[index])));
                        },
                        child: Hero(
                          tag: posts[index].id,
                          child: Image.network(posts[index].imageUrl,
                              fit: BoxFit.cover),
                        ));
                  });
            }));
  }
}
