import 'package:flutter_modular/flutter_modular.dart';
import 'modules/search/presenter/views/SplashScreen.dart';
import 'modules/search/presenter/views/home_page.dart';






class HomeModule extends Module {

  @override
  final List<ModularRoute> routes = [
    ChildRoute("/", child: (_, args) => SplashScreen()),
    ChildRoute("/HomePage/", child: (_, args) => HomePage()),
  ];

}