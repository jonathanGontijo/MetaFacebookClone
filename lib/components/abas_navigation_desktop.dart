import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:meta_facebook/components/abas_navigation.dart';
import 'package:meta_facebook/components/circle_buttom.dart';
import 'package:meta_facebook/components/profile_image_buttom.dart';
import 'package:meta_facebook/models/models.dart';
import 'package:meta_facebook/utils/fixed_colors.dart';

class AbasNavigationDesktop extends StatelessWidget {
  final List<IconData> icons;
  final int indiceSelectedAba;
  final Function(int) onTap;
  final User user;

  const AbasNavigationDesktop(
      {super.key,
      required this.user,
      required this.icons,
      required this.indiceSelectedAba,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4)
      ]),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "facebook",
              style: TextStyle(
                color: FixedColors.blueMeta,
                fontWeight: FontWeight.bold,
                fontSize: 32,
                letterSpacing: -1.2,
              ),
            ),
          ),
          Expanded(
            child: AbasNavigation(
              icons: icons,
              indiceSelectedAba: indiceSelectedAba,
              onTap: onTap,
              underIndicator: true,
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ProfileImageButtom(
                user: user,
                onTap: (){},
              ),
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
          ))
        ],
      ),
    );
  }
}
