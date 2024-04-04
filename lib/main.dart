import 'package:flutter/material.dart';
import 'package:new_package_installation/controller/home_screen_controller.dart';
import 'package:new_package_installation/view/home_screen/home_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await HomeScreenController.initDb();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
