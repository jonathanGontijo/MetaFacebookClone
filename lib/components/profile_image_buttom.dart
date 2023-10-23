import 'package:flutter/material.dart';
import 'package:meta_facebook/components/profile_image.dart';
import 'package:meta_facebook/models/models.dart';

class ProfileImageButtom extends StatelessWidget {
  final User user;
  final VoidCallback onTap;
  const ProfileImageButtom({super.key, required this.user, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileImage(urlImage: user.urlImage, viewed: true,),
          const SizedBox(width: 4,),
          Flexible(
            child: Text(
              user.name, 
              style: const TextStyle(
                fontSize: 16,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
