import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:meta_facebook/components/circle_buttom.dart';
import 'package:meta_facebook/components/contacts_list.dart';
import 'package:meta_facebook/components/option_list.dart';
import 'package:meta_facebook/components/post_card.dart';
import 'package:meta_facebook/components/story_area.dart';
import 'package:meta_facebook/date/date.dart';
import 'package:meta_facebook/models/models.dart';
import 'package:meta_facebook/utils/responsive.dart';

import '../components/create_post.dart';
import '../utils/fixed_colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TrackingScrollController _scrollController = TrackingScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Responsive(
      mobile: HomeMobile(scrollController: _scrollController,),
      tablet: HomeTablet(scrollController: _scrollController,),
      desktop: HomeDesktop(scrollController: _scrollController,),
    ));
  }
}

class HomeMobile extends StatelessWidget {
  final TrackingScrollController scrollController;

  const HomeMobile({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          centerTitle: false,
          title: const Text(
            "facebook",
            style: TextStyle(
                color: FixedColors.blueMeta,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2),
          ),
          actions: [
            CircleButtom(
              icon: Icons.search,
              iconsize: 30,
              onPressed: () {},
            ),
            CircleButtom(
              icon: LineIcons.facebookMessenger,
              iconsize: 30,
              onPressed: () {},
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePost(user: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: StoryArea(
              user: currentUser,
              stories: stories,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, indice) {
          Post post = posts[indice];
          return PostCard(post: post);
        }, childCount: posts.length))
      ],
    );
  }
}

class HomeTablet extends StatelessWidget {
  final TrackingScrollController scrollController;
  const HomeTablet({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          backgroundColor: Colors.white,
          floating: true,
          centerTitle: false,
          title: const Text(
            "Facebook",
            style: TextStyle(
                color: FixedColors.blueMeta,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2),
          ),
          actions: [
            CircleButtom(
              icon: Icons.search,
              iconsize: 30,
              onPressed: () {},
            ),
            CircleButtom(
              icon: LineIcons.facebookMessenger,
              iconsize: 30,
              onPressed: () {},
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: CreatePost(user: currentUser),
        ),
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
          sliver: SliverToBoxAdapter(
            child: StoryArea(
              user: currentUser,
              stories: stories,
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, indice) {
          Post post = posts[indice];
          return PostCard(post: post);
        }, childCount: posts.length))
      ],
    );
  }
}

class HomeDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const HomeDesktop({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: OptionList(user: currentUser),
            )),
        Spacer(),
        Flexible(
            flex: 5,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                  sliver: SliverToBoxAdapter(
                    child: StoryArea(
                      user: currentUser,
                      stories: stories,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: CreatePost(user: currentUser),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate((context, indice) {
                  Post post = posts[indice];
                  return PostCard(post: post);
                }, childCount: posts.length))
              ],
            )),
        Spacer(),
        Flexible(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ContactsList(users: onlineUser),
            )),
      ],
    );
  }
}
