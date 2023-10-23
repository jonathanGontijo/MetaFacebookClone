import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:meta_facebook/components/profile_image.dart';
import 'package:meta_facebook/models/models.dart';
import 'package:meta_facebook/utils/fixed_colors.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              PostHeader(post: post),
              Text(post.description),
            ],
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: CachedNetworkImage(imageUrl: post.urlImage),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: StatisticsPost(post: post),
        ),
      ],
    ));
  }
}

class StatisticsPost extends StatelessWidget {
  final Post post;
  const StatisticsPost({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: FixedColors.blueMeta, shape: BoxShape.circle),
              child: const Icon(
                Icons.thumb_up,
                size: 10,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              width: 4,
            ),
            Expanded(
              child: Text(
                "${post.likes}",
                style: TextStyle(color: Colors.grey[700]),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "${post.comments} comentários",
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              "${post.shares} compartilhamentos",
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
        const Divider(
          thickness: 1.2,
        ),
        Row(
          children: [
            PostButtom(
              icon: Icon(LineIcons.thumbsUpAlt, color: Colors.grey[700],),
               text: "Curtir",
                onTap: (){}
                ),
                PostButtom(
              icon: Icon(LineIcons.alternateCommentAlt, color: Colors.grey[700],),
               text: "Comentar",
                onTap: (){}
                ),
                PostButtom(
              icon: Icon(LineIcons.share, color: Colors.grey[700],),
               text: "Compartilhar",
                onTap: (){}
                )
          ],
        )
      ],
    );
  }
}

class PostButtom extends StatelessWidget {
  final Icon icon;
  final String text;
  final VoidCallback onTap;
  const PostButtom({super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        child: InkWell(
          onTap: onTap,
          child: Container(
            child: Row(
              children: [
                icon,
                const SizedBox(width: 4,),
                Text(text, style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostHeader extends StatelessWidget {
  final Post post;
  const PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImage(
          urlImage: post.user.urlImage,
          viewed: true,
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text("${post.timeAgo} - "),
                  const Icon(Icons.public)
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_horiz),
        )
      ],
    );
  }
}
