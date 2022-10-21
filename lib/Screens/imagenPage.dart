import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:pruebantpack/Services/services.dart';

class ImagenPage extends StatefulWidget {
   
  const ImagenPage({Key? key}) : super(key: key);

  @override
  State<ImagenPage> createState() => _ImagenPageState();
}

class _ImagenPageState extends State<ImagenPage> {
  // final userService = UserService();
    String _imagenPerfil2 = '';
  @override
  Widget build(BuildContext context) {
    final userServices = Provider.of<UserService>(context);
    return Scaffold(
      
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              final picker = new ImagePicker();
                            final PickedFile? pickedFile =
                                await picker.getImage(
                              source: ImageSource.gallery,
                              maxWidth: 800,
                              // imageQuality: 100,
                            );

                            if (pickedFile == null) {
                              print('No selecciono nada');
                              return;
                            } else{
                              userServices.imagen = pickedFile.path;

                              // setState(() {
                                
                              // });
                            }
                              // print('imagen' + pickedFile.path);
                            // setState(() {
                            //   _imagenPerfil2 = pickedFile.path;
                            // });
                            // print('---'+_imagenPerfil2);
                            // userService.actualizarImagenGaleria(pickedFile.path);
            },
            icon: Icon(Icons.camera_alt_outlined),
          )
        ],
        title: Text('Photo'),
      ),
      body: Center(
        child: Container(
          // width: 300,
          // height: 300,
          child: (userServices.imagen !='')?Image.file(
                                      File(userServices.imagen),
                                      fit: BoxFit.cover,
                                    ): Text('No imagen'),
        ),
      ),
    );
  }
}