import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meta_facebook/models/user.dart';

class CreatePost extends StatelessWidget {
  final User user;
  const CreatePost({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      color: Colors.white,
      child: Column(
        children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[200],
              backgroundImage: CachedNetworkImageProvider(user.urlImage),
            ),
            const SizedBox(width: 8,),
            const Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(
                  hintText: "No que você está pensando"),
                  )
                )
          ],
        ),
        const Divider(thickness: 0.5, height: 10,),
        Container(
          height: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            TextButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.videocam, color: Colors.red,),
              label: const Text("Ao vivo", style: TextStyle(color: Colors.black),),
             ),
             const VerticalDivider(width: 8,),
             TextButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.photo_library, color: Colors.green,),
              label: const Text("Foto", style: TextStyle(color: Colors.black),),
             ),
             const VerticalDivider(width: 8,),
             TextButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.video_call, color: Colors.purple,),
              label: const Text("Sala", style: TextStyle(color: Colors.black),),
             )
          ]
          ),
        )

      ]),
    );
  }
}
