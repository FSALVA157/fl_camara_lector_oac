import 'package:fl_oac/widgets/widgets.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ancho = size.width;
    final alto = size.height;

    return  Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: double.infinity,
              height: alto * 0.4,
              child: FadeInImage(
                placeholder: AssetImage('assets/loading.gif'),
                image: AssetImage('assets/logo_oac_1.png'),
                fit: BoxFit.contain,
                ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              height: alto * 0.1,
              child: ButtonMenu())
            ,
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              height: alto * 0.1,
              child: ButtonMenu())
            ,
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              padding: EdgeInsets.symmetric(vertical: 5),
              width: double.infinity,
              height: alto * 0.1,
              child: ButtonMenu())
            ,
            
            SizedBox(
              height: 500,
            )
          ],
        ),
      ),
    );
  }
}