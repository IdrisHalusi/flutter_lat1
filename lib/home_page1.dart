import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;


import 'package:image_gallery_saver/image_gallery_saver.dart';



class HomePage1 extends StatefulWidget {
  const HomePage1({super.key});

  @override
  State<HomePage1> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage1> {
  final ImagePicker picker = ImagePicker();
XFile? photo;
final GlobalKey _globalKey = GlobalKey();

_saveLocalImage() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      print(result);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('save image success'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title:  const Text ('Flutter Basic', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          elevation: 3,
          backgroundColor: const Color.fromARGB(255, 1, 118, 5),
          actions: const[
            Icon(Icons.person, color: Colors.white,),
            SizedBox(width: 10,),
            Icon(Icons.settings, color: Colors.white,),
            SizedBox(width: 10,),
          ],
          leading: const Icon(Icons.menu, color: Colors.white,),
        ),
        body: Column (
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RepaintBoundary(
                key: _globalKey,
                child: Container(
                  alignment: Alignment.center,
                  // width: 300,
                  height: 300,
                  color: Colors.blue,
                  child: photo == null 
                    ? const SizedBox() 
                    :Image.file(File(photo!.path)),
                ),
              ),
                
              ]
            ),
            const SizedBox(height: 16,),
            ElevatedButton (
              onPressed: (){
                _saveLocalImage();
              }, 
              child: const Text('Save to Galery', style: TextStyle(color: Colors.black),),
              )
            ] 
            ), 
              floatingActionButton: FloatingActionButton(
              onPressed: () async {
              photo = await picker.pickImage(source: ImageSource.camera);
              setState(() {
             });
          },
          backgroundColor: const Color.fromARGB(255, 89, 194, 89),
          child: const Icon(Icons.camera)),
      ),
    );
  }
}