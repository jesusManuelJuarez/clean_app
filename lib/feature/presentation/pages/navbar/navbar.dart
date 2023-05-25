import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

class NavBar extends StatefulWidget {
  final Function currentIndex;
  const NavBar({super.key, required this.currentIndex});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: index,
      selectedFontSize: 12,
      unselectedFontSize: 10,
      onTap: (int i) {
        setState(() {});
        index = i;
        widget.currentIndex(i);
      },
      selectedItemColor: Colors.blue,
      unselectedItemColor:Colors.blueGrey,
      //backgroundColor: ColorsNavBar.background,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.car_rental,color: (index==0)?Colors.amber:Colors.black12,),
          label: "Transporte",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.app_registration_rounded,color: (index==1)?Colors.amber:Colors.black12,),
          label: 'Registro',
        ),
      ],
    );
  }
}
