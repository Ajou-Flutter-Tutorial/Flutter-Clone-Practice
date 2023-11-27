class Post {
  String id;
  String userId;
  String title;
  String imageUrl;
  String userName;
  String userEmail;

  Post({required this.id, required this.userId, required this.title, required this.imageUrl, required this.userEmail, required this.userName});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
      userName: json['userName'] as String,
      userEmail: json['userEmail'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id':id,
      'userId': userId,
      'title': title,
      'imageUrl': imageUrl,
      'userName':userName,
      'userEmail':userEmail,
    };
  }
}
