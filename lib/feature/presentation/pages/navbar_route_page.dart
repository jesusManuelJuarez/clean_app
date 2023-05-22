import 'package:clean_app/feature/presentation/pages/navbar/navbar.dart';
import 'package:clean_app/feature/presentation/pages/route/route_navbar.dart';
import 'package:flutter/material.dart';

class NavbarRoutePage extends StatefulWidget {
  const NavbarRoutePage({super.key});

  @override
  State<NavbarRoutePage> createState() => _NavbarRoutePageState();
}

class _NavbarRoutePageState extends State<NavbarRoutePage> {
  int index = 0;
  NavBar? navBar;

  @override
  void initState() {
    navBar = NavBar(currentIndex: (i) {
      setState(() {
        index = i;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navBar,
      body: RouteNavBar(index: index),
    );
  }
}
