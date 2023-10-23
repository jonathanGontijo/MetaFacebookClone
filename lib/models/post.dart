import 'package:meta_facebook/models/models.dart';

class Post {
  User user;
  String description;
  String timeAgo;
  String urlImage;
  int likes;
  int comments;
  int shares;

  Post({
    required this.user,
    required this.description,
    required this.timeAgo,
    required this.urlImage,
    required this.likes,
    required this.comments,
    required this.shares,
   
  });
}
