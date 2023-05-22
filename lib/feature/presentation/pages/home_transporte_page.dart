import 'package:clean_app/feature/presentation/blocs/transporte_bloc.dart';
import 'package:clean_app/feature/presentation/check_conection/warning_widget_value_notifier.dart';

import 'package:clean_app/feature/presentation/pages/card_transporte.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';

class HomeTransportePage extends StatefulWidget {
  const HomeTransportePage({super.key});

  @override
  State<HomeTransportePage> createState() => _HomeTransportePageState();
}

class _HomeTransportePageState extends State<HomeTransportePage> {
  final controllerAsientos = TextEditingController();
  bool _ac = false;
  bool _trasmision = false;
  late bool _change = true;
  @override
  void initState() {
    super.initState();
    context.read<TransporteBloc>().add(GetTransporte());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              const WarningWidgetValueNotifier(),
              SafeArea(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: SizedBox(
                    width: 350,
                    child: Row(
                      children: [
                        Column(
                          children: const [
                            Text(
                              'VI',
                              style: TextStyle(
                                fontFamily: 'NunitoSans',
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                color: Color.fromRGBO(0, 0, 0, 1),
                                shadows: [
                                  Shadow(
                                    blurRadius: 10,
                                    color: Color.fromRGBO(174, 174, 174, 1),
                                    offset: Offset(0, 4),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'T',
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Color.fromRGBO(242, 191, 24, 1),
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10,
                                      color: Color.fromRGBO(174, 174, 174, 1),
                                      offset: Offset(0, 4),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'RA',
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  shadows: [
                                    Shadow(
                                      blurRadius: 10,
                                      color: Color.fromRGBO(174, 174, 174, 1),
                                      offset: Offset(0, 4),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10, left: 10),
                              child: Text(
                                'Transporte',
                                style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                    fontFamily: 'NunitoSans',
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 350,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(241, 242, 241, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 250,
                              child: Text(
                                '¡Encuentra tu transporte ideal!',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                  fontFamily: 'NunitoSans',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                )),
                              ),
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 100,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 40,
                                        child: IconButton(
                                          onPressed: () =>
                                              _showModalBottomSheet(context),
                                          icon: const Icon(
                                            Icons.search,
                                            color:
                                                Color.fromRGBO(242, 191, 24, 1),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 50,
                                        child: Text(
                                          'Filtros',
                                          style: GoogleFonts.nunito(
                                              textStyle: const TextStyle(
                                            fontFamily: 'NunitoSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Color.fromRGBO(0, 0, 0, 1),
                                          )),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                width: double.infinity,
                height: 600,
                  color: Colors.amber,
                child: BlocBuilder<TransporteBloc, TransporteState>(
                    builder: (context, state) {
                  if (state is Loading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Color.fromRGBO(242, 191, 24, 1),
                      ),
                    );
                  } else if (state is Loaded) {
                    return CardTransporte(listTransporte: state.transporte);
                  } else if (state is Error) {
                    return Center(
                      child: Text(
                        state.error.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }else{
                    return Container();
                  }
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showModalBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(30),
      )),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.5,
              maxChildSize: 0.8,
              minChildSize: 0.32,
              builder: (context, scrollController) => SingleChildScrollView(
                controller: scrollController,
                child: showModalSheet(setState),
              ),
            );
          },
        );
      },
    );
  }

  Widget showModalSheet(StateSetter state) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.none,
      children: [
        Positioned(
          top: -15,
          child: Container(
            width: 60,
            height: 7,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              width: 350,
              height: 400,
              child: Column(
                children: [
                  SizedBox(
                    width: 350,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 170,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                                color: const Color.fromRGBO(226, 228, 231, 1)),
                          ),
                          child: RadioListTile(
                            toggleable: true,
                            title: Text(
                              'Estandar',
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            groupValue: _trasmision,
                            onChanged: (value) {
                              state(() {
                                _trasmision = value!;
                              });
                            },
                            activeColor: const Color.fromRGBO(242, 191, 24, 1),
                            value: true,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 170,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                                color: const Color.fromRGBO(226, 228, 231, 1)),
                          ),
                          child: RadioListTile(
                            toggleable: true,
                            title: Text(
                              'Automatico',
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  fontFamily: 'Nunito',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            groupValue: _trasmision,
                            onChanged: (value) {
                              state(() {
                                _trasmision = value!;
                              });
                            },
                            activeColor: const Color.fromRGBO(242, 191, 24, 1),
                            value: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 350,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10),
                          width: 350,
                          height: 60,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5),
                            ),
                            border: Border.all(
                              color: const Color.fromRGBO(226, 228, 231, 1),
                            ),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 70,
                                height: 58,
                                child: Checkbox(
                                  value: _ac,
                                  shape: const CircleBorder(),
                                  activeColor:
                                      const Color.fromRGBO(242, 191, 24, 1),
                                  onChanged: (value) {
                                    state(() {
                                      _ac = value!;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 28,
                                height: 58,
                                child: Text(
                                  'A/C',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.nunito(
                                    textStyle: const TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    width: 350,
                    height: 60,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: TextField(
                      controller: controllerAsientos,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Ingresa un numero de asientos',
                        filled: true,
                        fillColor: const Color.fromRGBO(255, 255, 255, 1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(226, 228, 231, 1)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 60),
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (validar(controllerAsientos.text) && _change) {
                          Navigator.pop(context);
                        } else if (!_change) {
                          _ac = false;
                          _trasmision = false;
                          state(() {
                            _change = true;
                          });
                          controllerAsientos.text = '';
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(242, 191, 24, 1),
                      ),
                      child: Text(
                        (_change) ? 'Aplicar filtros' : 'Quitar filtros',
                        style: GoogleFonts.nunito(
                            textStyle: const TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  bool validar(String asientos) {
    if (asientos.isNotEmpty && (int.parse(asientos) > 0)) {
      return true;
    }
    showMensajeError();
    return false;
  }

  void showMensajeError() {
    QuickAlert.show(
      context: context,
      type: QuickAlertType.error,
      title: 'Oops...',
      text: '¡El numero ingresado no es valido!',
      onConfirmBtnTap: () {
        Navigator.pop(context);
      },
    );
  }
}
