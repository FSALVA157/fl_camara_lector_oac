
import 'dart:io';

import 'package:fl_oac/providers/data_form_provider.dart';
import 'package:fl_oac/screens/form_screen_2.dart';
import 'package:fl_oac/themes/global_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatelessWidget {
   
  const ListScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataFormProvider>(context);
    print(dataProvider.gente.length);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Listado de Registros del Dia'),
        centerTitle: true,
        leading: Icon(Icons.keyboard_arrow_left),
        actions: [
          IconButton(
            onPressed: () => {
              showDialog(
                context: context,
                builder: (context){
                    return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(15)
                            ),
                            title: Text('Confirmar Eliminación de Listado'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                (dataProvider.isProcessing)?
                                    CircularProgressIndicator():
                                  FlutterLogo(
                                    size: 50,
                                  )
                              ],                              
                            ),
                            actions: [
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(GlobalTheme.primary)
                                ),
                                child: Text('Borrar', style: TextStyle(color: Colors.white)),
                                onPressed: (){
                                    dataProvider.borrarTodosCiudadanos();
                                    return;
                                },
                              )
                            ],
                    );

              })
            },
            icon: Icon(Icons.delete_forever_sharp)
            )
        ],
      ),
      body: ListView.builder(
        itemCount: dataProvider.gente.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.map, color: GlobalTheme.primary,),
            title: Text('${dataProvider.gente[index].apellido} ${dataProvider.gente[index].nombre}'),
            subtitle: Text(dataProvider.gente[index].dniNumero.toString()),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
            onTap: (){
              dataProvider.persona = dataProvider.gente[index];
              Navigator.pushReplacement(context, MaterialPageRoute(builder: 
                              (context)=>FormScreen2())
                              ); 
              //Navigator.pushNamed(context, 'formulario');
            },
          );
        },
      ),
    );
  }
}