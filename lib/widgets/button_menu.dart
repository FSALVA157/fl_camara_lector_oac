
import 'package:flutter/material.dart';

class ButtonMenu extends StatelessWidget {
   
  const ButtonMenu({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
         child: MaterialButton(
              shape:  RoundedRectangleBorder(
              borderRadius:  BorderRadius.circular(10)
              ),
              color:  Colors.blueGrey[300],
              elevation:  0,
              disabledColor:  Colors.grey,
              child:  Text('Ingresar', style:  TextStyle(color:  Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              padding:  EdgeInsets.symmetric(horizontal:  80, vertical:  15),
              onPressed: (){})
      ),
    );
  }
}