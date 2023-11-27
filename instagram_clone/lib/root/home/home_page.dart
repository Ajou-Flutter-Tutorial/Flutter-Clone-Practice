import 'package:flutter/material.dart';
import 'package:instagram_clone/root/home/home_model.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeModel = HomeModel();

    return Scaffold(
        appBar: AppBar(
            title: Text(
          'Instagram Clone',
          style: GoogleFonts.pacifico(fontSize: 40),
        )),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                'Welcome to Instagram Clone',
                style: GoogleFonts.pacifico(fontSize: 20),
              ),
              const SizedBox(height: 20),
              const Text('추천 친구를 확인해보세요'),
              const SizedBox(height: 20),
              Card(
                elevation: 6.0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                        width: 100,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://i.namu.wiki/i/xl7WXBmp2VQ7mQRz53DlZ_7S1O4CEA_6RERhydKMTPYsdK9oXAcvqhtijh_rHQNw1fYt7skGA4vnMOJNg40jQA.webp'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('고윤정'),
                          Image.network(
                            'https://w7.pngwing.com/pngs/984/269/png-transparent-blue-check-logo-social-media-instagram-verified-badge-symbol-computer-icons-social-media-blue-leaf-influencer-marketing.png',
                            width: 15,
                            height: 15,
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                              'https://i.namu.wiki/i/Ay3-HwxQ7YyOVTlSCGlHi2M5Kr0VCCXkL3voaqLlRJxITECTywrrHP733O_5cJavN54J8J6zOGQga6IOt6hkzA.webp',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.network(
                              'https://res.heraldm.com/content/image/2023/09/27/20230927000148_0.jpg',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover),
                          const SizedBox(
                            width: 5,
                          ),
                          Image.network(
                              'https://img.etnews.com/news/article/2023/08/23/news-p.v1.20230823.f4e6c673a11e4239864e5f6b56611d73_Z1.jpg',
                              width: 70,
                              height: 70,
                              fit: BoxFit.cover),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text('Instagram 추천'),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('팔로우'),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
