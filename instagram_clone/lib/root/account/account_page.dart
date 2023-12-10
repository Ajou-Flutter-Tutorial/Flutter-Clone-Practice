import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_clone/root/account/account_model.dart';
import 'package:instagram_clone/root/auth/auth.dart';

import '../create/create_page.dart';
import '../domain/post.dart';
import '../post_detail/post_detail.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final accModel = AccountModel();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Instagram Clone',
          style: GoogleFonts.pacifico(fontSize: 20),
        ),
        actions: [
          IconButton(
            onPressed: () {
              accModel.logout();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Auth()),
              );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: CircleAvatar(

                          backgroundImage: NetworkImage(
                            accModel.getProfileImage(),
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: 25,
                          height: 25,
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const CreatePage()),
                              );
                            },
                            child: const Icon(Icons.add),
                          ),
                        ),
                      )
                    ],
                  ),
                  Text(
                    accModel.getDisplayName(),
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Column(
                children: [
                  StreamBuilder<QuerySnapshot<Post>>(
                      stream: accModel.myPostsStream,
                      builder: (context, snapshot) {
                        if(snapshot.hasData) {
                          return Text(
                            '${snapshot.data!.size}',
                            style: const TextStyle(fontSize: 15),
                          );
                        }else{
                          return const Text(
                            '0',
                            style: TextStyle(fontSize: 15),
                          );
                        }
                      }),
                  const Text(
                    '게시물',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const Column(
                children: [
                  Text(
                    '0',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    '팔로워',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              const Column(
                children: [
                  Text(
                    '0',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    '팔로잉',
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<QuerySnapshot<Post>>(
                  stream: accModel.myPostsStream,
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
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 2.0,
                            crossAxisSpacing: 2.0),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PostDetailPage(
                                            post: posts[index])));
                              },
                              child: Hero(
                                tag: posts[index].id,
                                child: Image.network(posts[index].imageUrl,
                                    fit: BoxFit.cover),
                              ));
                        });
                  }),
            ),
          )

        ],
      ),
    );
  }
}
