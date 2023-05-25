import 'package:clean_app/feature/domain/entities/transporte.dart';
import 'package:clean_app/feature/presentation/blocs/transporte/transporte_bloc.dart';
import 'package:clean_app/feature/presentation/pages/edit_transporte_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTransporte extends StatefulWidget {
  final List<Transporte> listTransporte;
  const CardTransporte({super.key, required this.listTransporte});

  @override
  State<CardTransporte> createState() => _CardTransporteState();
}

class _CardTransporteState extends State<CardTransporte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (widget.listTransporte.isNotEmpty)
          ? ListView.builder(
              itemCount: widget.listTransporte.length,
              itemBuilder: (context, index) {
                Transporte data = widget.listTransporte[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  width: 350,
                  height: 270,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(15),
                    ),
                    border: Border.all(
                        color: const Color.fromRGBO(226, 228, 231, 1)),
                    color: Colors.white,
                  ),
                  child: Stack(
                    alignment: AlignmentDirectional.topCenter,
                    children: [
                      Container(
                        width: 370,
                        height: 170,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                          color: Colors.amber,
                        ),
                      ),
                      Positioned(
                        left: -5,
                        bottom: 88,
                        child: Text(
                          'VITRA',
                          style: GoogleFonts.mPlusRounded1c(
                            textStyle: const TextStyle(
                              fontSize: 135,
                              fontWeight: FontWeight.w800,
                              color: Color.fromARGB(104, 255, 255, 255),
                            ),
                          ),
                          softWrap: true,
                        ),
                      ),
                      Positioned(
                        bottom: 52,
                        left: 57,
                        child: SizedBox(
                          width: 300,
                          height: 250,
                          child: SvgPicture.asset('assets/card_car.svg'),
                        ),
                      ),
                      Positioned(
                        left: 85,
                        top: 130,
                        child: Container(
                          width: 250,
                          height: 60,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: Color.fromRGBO(255, 255, 255, 1),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 19,
                                  offset: Offset(0, 4),
                                  color: Color.fromRGBO(174, 174, 174, 1),
                                )
                              ]),
                          child: Text(
                            '\$ ${data.precio}.00',
                            style: GoogleFonts.mPlusRounded1c(
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: Color.fromRGBO(242, 191, 24, 1),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 185,
                        left: 15,
                        child: SizedBox(
                          width: 240,
                          child: Text(
                            data.modelo,
                            style: GoogleFonts.mPlusRounded1c(
                              textStyle: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w800,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 220,
                        left: 15,
                        child: SizedBox(
                          width: 200,
                          child: Text(
                            data.detalles,
                            style: GoogleFonts.mPlusRounded1c(
                              textStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(0, 0, 0, 1),
                              ),
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 220,
                        left: 120,
                        child: Container(
                          width: 150,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                            ),
                            child: const Text('¡Rentar ahora!'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 220,
                        left: 275,
                        child: Container(
                          width: 70,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<TransporteBloc>().add(PressDeleteUserButton(id: data.id));
                              context.read<TransporteBloc>().add(GetTransporte());
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.red
                            ),
                            child: const Icon(Icons.delete),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 220,
                        left: 350,
                        child: Container(
                          alignment: Alignment.center,
                          width: 55,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: ElevatedButton(
                            onPressed: () {
                              Route route = MaterialPageRoute(builder: (context)=>EditTransportePage(transporte: data));
                              Navigator.push(context, route);
                            },
                            style: ElevatedButton.styleFrom(
                              shape: const StadiumBorder(),
                              backgroundColor: Colors.green
                            ),
                            child: const Icon(Icons.edit),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            )
          : const Center(
              child: Text('No data'),
            ),
    );
  }

}
