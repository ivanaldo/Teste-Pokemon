import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app_module.dart';
import 'app_widget.dart';

void main(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // cor da barra superior
    statusBarIconBrightness: Brightness.dark, // ícones da barra superior
  ));
  runApp(ModularApp(module: AppModule(), child: AppWidget(),));
}

