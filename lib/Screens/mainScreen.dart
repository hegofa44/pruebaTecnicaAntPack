import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebantpack/Providers/optProvider.dart';
import 'package:pruebantpack/Screens/screens.dart';
import 'package:pruebantpack/widgets/widgets.dart';

class MainScreen extends StatelessWidget {
   
  const MainScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: MenuBar(),
      body: _PaginaSeleccionada(),
    );
  }
}
class _PaginaSeleccionada extends StatelessWidget {
  const _PaginaSeleccionada({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selectedScreenProvider = Provider.of<SelectedScreenProvider>(context);
    final opcionSeleccionada = selectedScreenProvider.opcionSeleccionada;

    switch (opcionSeleccionada) {
      case 0:
        return UserScreen();
      case 1:
        return ImagenScreen();
      default:
        return UserScreen();
    }
  }
}