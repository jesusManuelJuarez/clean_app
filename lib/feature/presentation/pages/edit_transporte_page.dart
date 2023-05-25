import 'package:clean_app/feature/domain/entities/transporte.dart';
import 'package:clean_app/feature/presentation/blocs/transporte/transporte_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../blocs/transportes/transportes_bloc.dart';

class EditTransportePage extends StatefulWidget {
  final Transporte transporte;
  const EditTransportePage({super.key, required this.transporte});

  @override
  State<EditTransportePage> createState() => _EditTransportePageState();
}

class _EditTransportePageState extends State<EditTransportePage> {
  bool _ac = false;
  bool _trasmision = false;
  final String foto = "assets/images/card_pressed/card_car.svg";
  final String estatus = "Disponible";
  final modelController = TextEditingController();
  final asientosController = TextEditingController();
  final precioController = TextEditingController();
  final detallesController = TextEditingController();

  @override
  void initState() {
    final data = widget.transporte;
    modelController.text = data.modelo;
    asientosController.text = data.numAsientos;
    precioController.text = data.precio;
    detallesController.text = data.detalles;
    _trasmision = (data.trasmision.compareTo("Estandar") == 0) ? false : true;
    _ac = (data.ac.compareTo("si") == 0 || data.ac.compareTo("Si") == 0)
        ? true
        : false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: SizedBox(
        width: double.infinity,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: 350,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 100,
                        child: Row(
                          children: [
                            Text(
                              "Registro",
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  fontSize: 28,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ),
                            Text(
                              " de ",
                              style: GoogleFonts.nunito(
                                  textStyle: const TextStyle(
                                fontSize: 28,
                                fontFamily: 'Nunito Sans',
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(242, 191, 24, 1),
                              )),
                            ),
                            Text(
                              "unidades",
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  fontSize: 28,
                                  fontFamily: 'Nunito Sans',
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 100),
                      height: 400,
                      width: 350,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 340,
                                  child: Text(
                                    'Trasmisión',
                                    style: GoogleFonts.nunito(
                                        textStyle: const TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400,
                                    )),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 170,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            226, 228, 231, 1)),
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
                                      )),
                                    ),
                                    groupValue: _trasmision,
                                    onChanged: (value) {
                                      setState(() {
                                        _trasmision = value!;
                                      });
                                    },
                                    activeColor:
                                        const Color.fromRGBO(242, 191, 24, 1),
                                    value: false,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 170,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            226, 228, 231, 1)),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        width: 167,
                                        child: RadioListTile(
                                          toggleable: true,
                                          title: Text(
                                            'Automatico',
                                            style: GoogleFonts.nunito(
                                                textStyle: const TextStyle(
                                              fontFamily: 'Nunito',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            )),
                                          ),
                                          groupValue: _trasmision,
                                          onChanged: (value) {
                                            setState(() {
                                              _trasmision = value!;
                                            });
                                          },
                                          activeColor: const Color.fromRGBO(
                                              242, 191, 24, 1),
                                          value: true,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 340,
                                    child: Text(
                                      'A/C',
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 170,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            226, 228, 231, 1)),
                                  ),
                                  child: RadioListTile(
                                    toggleable: true,
                                    title: Text(
                                      'Si',
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      )),
                                    ),
                                    groupValue: _ac,
                                    onChanged: (value) {
                                      setState(() {
                                        _ac = value!;
                                      });
                                    },
                                    activeColor:
                                        const Color.fromRGBO(242, 191, 24, 1),
                                    value: false,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 170,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                    border: Border.all(
                                        color: const Color.fromRGBO(
                                            226, 228, 231, 1)),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        width: 167,
                                        child: RadioListTile(
                                          toggleable: true,
                                          title: Text(
                                            'No',
                                            style: GoogleFonts.nunito(
                                                textStyle: const TextStyle(
                                              fontFamily: 'Nunito',
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                            )),
                                          ),
                                          groupValue: _ac,
                                          onChanged: (value) {
                                            setState(() {
                                              _ac = value!;
                                            });
                                          },
                                          activeColor: const Color.fromRGBO(
                                              242, 191, 24, 1),
                                          value: true,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 170,
                                    child: Text(
                                      'Modelo',
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      )),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 170,
                                    child: Text(
                                      'Numero de asientos',
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 170,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: TextField(
                                    controller: modelController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                226, 228, 231, 1)),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 170,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 60,
                                        width: 168,
                                        child: TextField(
                                          controller: asientosController,
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: const Color.fromRGBO(
                                                255, 255, 255, 1),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                color: Color.fromRGBO(
                                                    226, 228, 231, 1),
                                                width: 1,
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              width: 340,
                              child: Row(
                                children: [
                                  SizedBox(
                                    child: Text(
                                      'Precio por día',
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 340,
                                  height: 60,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: precioController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                226, 228, 231, 1)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 5),
                              width: 340,
                              child: Row(
                                children: [
                                  SizedBox(
                                    child: Text(
                                      'Detalles',
                                      style: GoogleFonts.nunito(
                                          textStyle: const TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w400,
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(top: 10),
                                  width: 340,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: detallesController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(6),
                                        borderSide: const BorderSide(
                                            color: Color.fromRGBO(
                                                226, 228, 231, 1)),
                                      ),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 3,
                                    maxLength: 300,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<TransportesBloc, TransportesState>(
                    builder: (context, state) {
                  if (state is SavingTransportes) {
                    return const CircularProgressIndicator();
                  } else if (state is TransportesSaved) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('Transporte actualizado correctamente'),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Regresar'),
                        )
                      ],
                    );
                  } else if (state is ErrorSavingTransportes) {
                    return Text(
                      state.message,
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return const Center();
                  }
                }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                      width: 220,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          backgroundColor:
                              const Color.fromRGBO(242, 191, 24, 1),
                        ),
                        onPressed: () async {
                          String aireSelected = (_ac == false) ? "Si" : "No";
                          String trasmisionSelected = (_trasmision == false)
                              ? 'Estandar'
                              : "Automatico";
                          Transporte transporte = Transporte(
                              nombreEmpresa: widget.transporte.nombreEmpresa,
                              trasmision: trasmisionSelected,
                              ac: aireSelected,
                              numAsientos: asientosController.text,
                              modelo: modelController.text,
                              precio: precioController.text,
                              detalles: detallesController.text,
                              disponible: estatus,
                              id: widget.transporte.id);
                          context.read<TransportesBloc>().add(
                              PressUpdateTransportesButton(
                                  transporte: transporte));
                          context.read<TransporteBloc>().add(GetTransporte());
                        },
                        child: Text(
                          'Editar',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 23,
                            fontWeight: FontWeight.bold,
                          )),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
