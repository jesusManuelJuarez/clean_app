import 'package:clean_app/feature/domain/entities/transporte.dart';
import 'package:clean_app/feature/presentation/blocs/transportes/transportes_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterHomeTransportePage extends StatefulWidget {
  const RegisterHomeTransportePage({super.key});

  @override
  State<RegisterHomeTransportePage> createState() => _RegisterHomeTransportePageState();
}

class _RegisterHomeTransportePageState extends State<RegisterHomeTransportePage> {
  bool _ac = false;
  bool _trasmision = false;
  late String trasmisionSelected = "";
  final String estatus = "DISPONIBLE";
  late String aireSelected = "";
  final String acSelected = "";
  final modelController = TextEditingController();
  final asientosController = TextEditingController();
  final precioController = TextEditingController();
  final detallesController = TextEditingController();

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
                BlocBuilder<TransportesBloc,TransportesState>(builder: (context,state){
                  if(state is SavingTransportes){
                    return const CircularProgressIndicator();
                  }else if(state is TransportesSaved){
                    return const Text('Transporte registrado correctamente');
                  }else if(state is ErrorSavingTransportes){
                    return Text(state.message,style: const TextStyle(color: Colors.red),);
                  }else{
                    return const Center();
                  }
                })
                ,
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
                          aireSelected = (_ac == false) ? "Si" : "No";
                          trasmisionSelected = (_trasmision == false)
                              ? 'Estandar'
                              : "Automatico";
                          Transporte transporte = Transporte(
                              nombreEmpresa: "T",
                              trasmision: trasmisionSelected,
                              ac: aireSelected,
                              numAsientos: asientosController.text,
                              modelo: modelController.text,
                              precio: precioController.text,
                              detalles: detallesController.text,
                              disponible: estatus,
                              id: "0");
                          context.read<TransportesBloc>().add(PressCreateTransportesButton(transporte: transporte));
                        },
                        child: Text(
                          'Registrar',
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

  bool validar(
    String asientos,
    String trasmision,
    String aire,
    String modelo,
    String detalles,
    String disponible,
    String precio,
  ) {
    return (asientos.isNotEmpty &
                trasmision.isNotEmpty &
                aire.isNotEmpty &
                modelo.isNotEmpty &
                detalles.isNotEmpty &
                disponible.isNotEmpty &
                precio.isNotEmpty &&
            int.parse(precio) > 0)
        ? true
        : false;
  }
}
