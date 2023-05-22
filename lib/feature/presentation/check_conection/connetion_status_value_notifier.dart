import 'dart:async';
import 'package:clean_app/main.dart';
import 'package:flutter/material.dart';
import 'check_internet_conection.dart';


class ConnetionStatusValueNotifier extends ValueNotifier<ConnectionStatus>{
  late StreamSubscription _connectionSubscription;

  ConnetionStatusValueNotifier() : super (ConnectionStatus.online) {
    _connectionSubscription = internetChecker
        .internetStatus()
        .listen((newStatus) => value = newStatus);
  }

  @override
  void dispose(){
    _connectionSubscription.cancel();
    super.dispose();
  }
}