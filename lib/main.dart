import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebantpack/Providers/optProvider.dart';
import 'package:pruebantpack/Screens/screens.dart';
import 'package:pruebantpack/Services/services.dart';

void main() => runApp(const AppState());
class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: 
    [
      ChangeNotifierProvider(create: (_) => UserService(), lazy: false,),
      ChangeNotifierProvider(create: (_) => SelectedScreenProvider()),
    ],
    child: MyApp(),
    );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AntPack',
      initialRoute: 'mainScreen',
      routes: {
        'userScreen':(context) => (UserScreen()),
        'imagenScreen':(context) => (ImagenScreen()),
        'mainScreen':(context) => (MainScreen()),
        'imagenPage':(context) => (ImagenPage()),
      },
    );
  }
}