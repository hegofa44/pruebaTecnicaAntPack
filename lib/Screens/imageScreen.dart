import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:pruebantpack/Services/services.dart';

class ImagenScreen extends StatefulWidget {
   
  const ImagenScreen({Key? key}) : super(key: key);

  @override
  State<ImagenScreen> createState() => _ImagenScreenState();
}

class _ImagenScreenState extends State<ImagenScreen> {
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
        child: ClipRRect(
          // borderRadius: BorderRadius.circular(10.0),
          child: Container(
            
            width: (userServices.imagen !='')?double.infinity:300,
            height: (userServices.imagen !='')?double.infinity:400,
            child: (userServices.imagen !='')?Image.file(
                                        File(userServices.imagen),
                                        fit: BoxFit.cover,
                                      ): Column(
                                        children: [
                                          Image.asset('assets/image.png'),
                                          SizedBox(height: 10.0,),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color: Colors.lightBlue,
        
                                              )
                                            ),
                                            // padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                                            child: TextButton(onPressed: ()async {
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
                                            }, child: Text('Seleccionar imagen')))
                                        ],
                                      ),
          ),
        ),
      ),
    );
  }
}