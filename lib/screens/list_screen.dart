
import 'package:fl_oac/providers/data_form_provider.dart';
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
      ),
      body: ListView.builder(
        itemCount: dataProvider.gente.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Icon(Icons.map, color: GlobalTheme.primary,),
            title: Text(dataProvider.gente[index].apellido),
            subtitle: Text(dataProvider.gente[index].dniNumero.toString()),
            trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
            onTap: (){},
          );
        },
      ),
    );
  }
}