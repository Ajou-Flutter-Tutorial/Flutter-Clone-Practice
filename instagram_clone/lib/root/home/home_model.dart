import 'package:firebase_auth/firebase_auth.dart';

class HomeModel {
  String getEmail(){
    return FirebaseAuth.instance.currentUser?.email ?? '';
  }

  String getDisplayName(){
    return FirebaseAuth.instance.currentUser?.displayName ?? '';
  }

  String getProfileImage(){
    return FirebaseAuth.instance.currentUser?.photoURL ?? 'https://previews.123rf.com/images/happyvector071/happyvector0711904/happyvector071190414608/120957993-%EB%B0%B0%EA%B2%BD%EC%97%90-%EA%B3%A0%EB%A6%BD-%EB%90%9C-%EA%B8%B0%EB%B3%B8-%EC%95%84%EB%B0%94%ED%83%80-%ED%94%84%EB%A1%9C%ED%95%84-%EC%9E%90%EB%A6%AC-%ED%91%9C%EC%8B%9C%EC%9E%90%EC%9D%98-%EC%B0%BD%EC%9D%98%EC%A0%81%EC%9D%B8-%EA%B7%B8%EB%A6%BC-%EC%95%84%ED%8A%B8-%EB%94%94%EC%9E%90%EC%9D%B8-%ED%9A%8C%EC%83%89-%EC%82%AC%EC%A7%84-%EB%B9%88-%ED%85%9C%ED%94%8C%EB%A6%BF-%EB%AA%A8%ED%98%95%EC%9E%85%EB%8B%88%EB%8B%A4-%EC%B6%94%EC%83%81-%EA%B0%9C%EB%85%90-%EA%B7%B8%EB%9E%98%ED%94%BD.jpg';
  }
}