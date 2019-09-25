import 'package:flutter/material.dart';

class Modal extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _ModalState();
}

class _ModalState extends State<Modal>{
  
  Widget build(BuildContext context){

    return MaterialApp(
      title: 'Image Picker',
      home: Scaffold(
        appBar: AppBar(title: Text('Workmanager test'),),
        body: Center(child:Text('Wake up!s')),
    ));
    
  }
}