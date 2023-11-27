import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterfire_ui/auth.dart';

import '../login/login_page.dart';
import '../root_page.dart';


class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {

    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return LoginPage();
            return SignInScreen(
              providerConfigs: [
                EmailProviderConfiguration(),
              ],
              headerBuilder: (context,constraints,_){
                return Center(child: Text('Instagram Clone',style: TextStyle(fontSize: 40),),);
              },
            );
          }

          return const RootPage();
        });
  }
}
