import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:movie_app/home/ui/screens/home_screen.dart';
import 'package:movie_app/common/common.dart';
// import 'package:movie_app/models/enviroment.dart';

Future<void> main() async {
  await dotenv.load(fileName: Enviroment.fileName);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
      ],
    );
  }
}
