import 'package:flutter/material.dart';
import 'package:meta_facebook/utils/fixed_colors.dart';

class AbasNavigation extends StatelessWidget {
  final List<IconData> icons;
  final int indiceSelectedAba;
  final Function(int) onTap;
  final bool underIndicator;

  const AbasNavigation(
      {super.key,
      required this.icons,
      required this.indiceSelectedAba,
      required this.onTap,
      this.underIndicator = false
      });

  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: onTap,
        indicator: BoxDecoration(
          border: underIndicator
              ? Border(
                  bottom: BorderSide(
                      color: FixedColors.blueMeta,
                      width: 3
                  ),
                )
              : Border(
                  top: BorderSide(
                      color: FixedColors.blueMeta,
                      width: 3
                  ),
          )
        ),
      tabs: icons
          .asMap()
          .map((indice, item) {
            return MapEntry(
                indice,
                Tab(
                  icon: Icon(
                    item,
                    color: indiceSelectedAba == indice
                        ? FixedColors.blueMeta
                        : Colors.black,
                    size: 30,
                  ),
                ));
          })
          .values
          .toList(),
    );
  }
}
