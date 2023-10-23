import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:meta_facebook/components/profile_image_buttom.dart';
import 'package:meta_facebook/models/models.dart';
import 'package:meta_facebook/utils/fixed_colors.dart';

class OptionList extends StatelessWidget {
  final User user;
  final List<List> _option = const [
    [LineIcons.userFriends, FixedColors.blueMeta, "Amigos"],
    [LineIcons.facebookMessenger, FixedColors.blueMeta, "Mensagens"],
    [LineIcons.flag, Colors.orange, "Páginas"],
    [LineIcons.users, FixedColors.blueMeta, "Grupos"],
    [Icons.storefront_outlined, FixedColors.blueMeta, "Marketplace"],
    [Icons.ondemand_video, Colors.red, "Assistir"],
    [LineIcons.calendar, Colors.purple, "Eventos"],
    [LineIcons.chevronCircleDown, Colors.black45, "Ver mais"]
  ];
  const OptionList({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          itemCount: 1 + _option.length,
          itemBuilder: (context, indice) {
            if (indice == 0) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: ProfileImageButtom(
                  user: user,
                  onTap: () {},
                ),
              );
            }

            List item = _option[indice - 1];
            return Padding(
              padding: const EdgeInsets.all(6.0),
              child: Option(
                icon: item[0],
                color: item[1],
                 text: item[2],
                  onTap: (){}
            ),
            );
          }),
    );
  }
}

class Option extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onTap;
  const Option({super.key, required this.icon, required this.color, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 35,),
          const SizedBox(width: 4,),
          Flexible(
            child: Text(
              text, 
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
