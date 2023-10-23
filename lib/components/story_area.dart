import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meta_facebook/components/profile_image.dart';
import 'package:meta_facebook/date/date.dart';
import 'package:meta_facebook/utils/fixed_colors.dart';

import '../models/models.dart';

class StoryArea extends StatelessWidget {
  final User user;
  final List<Story> stories;

  const StoryArea({super.key, required this.user, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,//1 + 8 = 9
          itemBuilder: (context, indice){

            if( indice == 0 ){

              Story userStory = Story(
                  user: currentUser,
                  urlImage: currentUser.urlImage
              );

              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: StoryCard(
                  storyAdd: true,
                  story: userStory,
                ),
              );

            }

            Story story = stories[indice - 1];//1

            return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: StoryCard(
                  story: story,
                ),
            );
          }
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  final Story story;
  final bool storyAdd;

  const StoryCard({super.key, required this.story, this.storyAdd = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: story.urlImage,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
            gradient: FixedColors.degradeStory,
            borderRadius: BorderRadius.circular(12)
          ),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: storyAdd ? Container(
            height: 30,
             width: 30,
              decoration: const BoxDecoration(
                 color: Colors.white,
                  shape: BoxShape.circle
                  ),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: const Icon(Icons.add),
                    iconSize: 30,
                    color: FixedColors.blueMeta,
                    onPressed: (){},
                  ),
                  ) : ProfileImage(
                    urlImage: story.user.urlImage,
                    viewed: story.viewed,
                  )
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  right: 8,  
                  child: Text(
                    storyAdd ? "Criar Story" : story.user.name, 
                    style: const TextStyle(
                      color: Colors.white,
                       fontWeight: FontWeight.bold
                       ),
                       maxLines: 2,
                        overflow: TextOverflow.ellipsis,),
                        )
      ],
    );
  }
}
