import 'package:fl_oac/models/data_model.dart';
import 'package:fl_oac/services/db_service.dart';
import 'package:flutter/material.dart';

class DataFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  late DataModel persona = new DataModel(
        dniNumero: 21633094,      
        nacimiento: "02/08/1970",
        apellido: "Salva",
        nombre: "Fernando",
        sexo: "masculino"
  );
  
  List<DataModel> gente = [];
  bool _isProcessing = false;

  bool get isProcessing => _isProcessing;

  void set isProcessing(bool valor){
    _isProcessing = valor;
    notifyListeners();
  }

  altaCiudadano(DataModel persona) async{
      int clave = await DBService.db.nuevoCiudadano(persona);
      persona.id = clave;
      this.gente.add(persona);
  }
  
  cargarGente()async{
    final ciudadanosfromDB = await DBService.db.getAllCiudadano();
    this.gente = [...ciudadanosfromDB];
    notifyListeners();
  }

  borrarTodosCiudadanos()async{
    isProcessing = true;
    await DBService.db.deleteAllCiudadanos();
    this.gente = [];
    isProcessing = false;
    notifyListeners();
  }

  borrarCiudadanoPorId(int id) async{
    await DBService.db.deleteCiudadano(id);
    this.cargarGente();
  }


  bool isValid(){
    return formKey.currentState?.validate() ?? false;
  }

  
}
