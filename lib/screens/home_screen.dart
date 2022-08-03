
import 'package:fl_oac/providers/data_form_provider.dart';
import 'package:fl_oac/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataFormProvider>(context);

    final size = MediaQuery.of(context).size;
    final ancho = size.width;
    final alto = size.height;

    dataProvider.cargarGente();
    

    return  Scaffold(
      body: ScrollViewBotonera(alto: alto),
    );
  }
}


class ScrollViewBotonera extends StatelessWidget {
  const ScrollViewBotonera({
    Key? key,
    required this.alto,
  }) : super(key: key);

  final double alto;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
            child: ButtonMenu(
              label: "Escanear D.N.I.",
              icono: Icons.qr_code,
              funcion: () {
                return () => Navigator.pushNamed(context, 'scan');
              }
              ))
          ,
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            height: alto * 0.1,
            child: ButtonMenu(
              label: "Llenar Formulario",
              icono: Icons.people,
              funcion: () {
                return () => Navigator.pushNamed(context, 'formulario');
              }
              ))
          ,
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            padding: EdgeInsets.symmetric(vertical: 5),
            width: double.infinity,
            height: alto * 0.1,
            child: ButtonMenu(
              label: "Consultar Listado",
              icono: Icons.list,
              funcion: () {
                return () => Navigator.pushNamed(context, 'lista');
              },
              ))
          ,
          
          SizedBox(
            height: 500,
          )
        ],
      ),
    );
  }
}