import 'package:clean_app/feature/presentation/blocs/transporte_bloc.dart';
import 'package:clean_app/feature/presentation/check_conection/check_internet_conection.dart';
import 'package:clean_app/feature/presentation/pages/navbar_route_page.dart';
import 'package:clean_app/usecase_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final internetChecker = CheckInternetConnection();

UsecaseConfig usecaseConfig = UsecaseConfig();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TransporteBloc>(
          create: (BuildContext context) => TransporteBloc(
              getTransporteUsecase: usecaseConfig.getTransporteUsecase!),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: NavbarRoutePage(),
      ),
    );
  }
}
