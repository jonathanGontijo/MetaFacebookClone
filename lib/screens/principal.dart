import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:meta_facebook/components/abas_navigation.dart';
import 'package:meta_facebook/components/abas_navigation_desktop.dart';
import 'package:meta_facebook/date/date.dart';
import 'package:meta_facebook/screens/home.dart';
import 'package:meta_facebook/utils/responsive.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  final List<Widget> _screens = [
    const Home(),
    //Video page
    const Scaffold(
      backgroundColor: Colors.green,
    ),
    //Marketplace page
    const Scaffold(
      backgroundColor: Colors.yellow,
    ),
    //Flag page
    const Scaffold(
      backgroundColor: Colors.red,
    ),
    //Notification page
    const Scaffold(
      backgroundColor: Colors.purple,
    ),
    //Menu Page
    const Scaffold(
      backgroundColor: Colors.orange,
    ),
  ];
  List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    Icons.storefront_outlined,
    Icons.flag_outlined,
    LineIcons.bell,
    Icons.menu,
  ];

  int _indiceSelectedAba = 0;

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.IsDesktop(context);
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: isDesktop
            ? PreferredSize(
                child: AbasNavigationDesktop(
                  user: currentUser,
                  icons: _icons,
                  indiceSelectedAba: _indiceSelectedAba,
                  onTap: (indice) {
                  setState(() {
                    _indiceSelectedAba = indice;
                  });
                },
                ),
                preferredSize: Size(size.width, 65),
              )
            : null,
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: _screens,
        ),
        bottomNavigationBar: isDesktop
            ? null
            : AbasNavigation(
                icons: _icons,
                indiceSelectedAba: _indiceSelectedAba,
                onTap: (indice) {
                  setState(() {
                    _indiceSelectedAba = indice;
                  });
                },
              ),
      ),
    );
  }
}
