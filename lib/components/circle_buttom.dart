import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class CircleButtom extends StatelessWidget {
  final IconData icon;
  final double iconsize;
  final VoidCallback onPressed;

  const CircleButtom({super.key, required this.icon, required this.iconsize, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
          margin: EdgeInsets.all(6),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon),
        iconSize: 30,
        color: Colors.black,
      ),
    );
  }
}
