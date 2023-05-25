import 'package:clean_app/feature/presentation/pages/home_transporte_page.dart';
import 'package:clean_app/feature/presentation/pages/register_home_transporte_page.dart';
import 'package:flutter/widgets.dart';

class RouteNavBar extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final int index;

  const RouteNavBar({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    List<Widget> listaViews = [
      const HomeTransportePage(),
      const RegisterHomeTransportePage()
    ];
    return listaViews[index];
  }
}