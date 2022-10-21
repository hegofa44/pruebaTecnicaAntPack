import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pruebantpack/Providers/optProvider.dart';

class MenuBar extends StatelessWidget {
  const MenuBar({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
  final opcionSelect = Provider.of<SelectedScreenProvider>(context);
  final currentIndex = opcionSelect.opcionSeleccionada;
    return BottomNavigationBar(
      onTap: (int i) => opcionSelect.opcionSeleccionada = i,
      currentIndex: currentIndex,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.people_alt_outlined), label: 'User'),
      BottomNavigationBarItem(icon: Icon(Icons.camera_outlined), label: 'Image'),
    ]);
  }
}