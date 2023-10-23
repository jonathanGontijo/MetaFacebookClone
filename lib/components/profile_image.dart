import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meta_facebook/utils/fixed_colors.dart';

class ProfileImage extends StatelessWidget {
  final String urlImage;
  final bool viewed;

  const ProfileImage({
    super.key,
    required this.urlImage,
    this.viewed = false,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: FixedColors.blueMeta,
      child: CircleAvatar(
        radius: viewed ? 20 : 18,
        backgroundImage: CachedNetworkImageProvider(urlImage),
        backgroundColor: Colors.grey[200],
      ),
    );
  }
}
