import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../root_page.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Instagram Clone',
              style: GoogleFonts.pacifico(
                fontSize: 40.0,
              ),
            ),
            Container(
              margin: EdgeInsets.all(50.0),
            ),
            SignInButton(
              Buttons.google,
              onPressed: () async {
                await signInWithGoogle();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RootPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);

    final UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final User user = userCredential.user!;
  }
}
