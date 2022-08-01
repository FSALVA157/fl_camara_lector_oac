
import 'package:fl_oac/themes/global_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {
  final String label;
  final IconData? icono;
  final Function funcion;
   
  const ButtonMenu({required this.label, this.icono, required this.funcion});
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ElevatedButton.icon(
          style: elevatedButtonStyle(),
          onPressed: funcion(),
          icon: Icon(this.icono, size: 30),
          label: Text(this.label, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
          ) 
      ),
    );
  }

  ButtonStyle elevatedButtonStyle() {
    return ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
          elevation:MaterialStateProperty.all(10) ,
          backgroundColor: MaterialStateProperty.all(GlobalTheme.primary),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          alignment: Alignment.center
           );
  }
}