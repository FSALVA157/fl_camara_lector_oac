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
        sexo: "masculino",
        foto: "/data/user/0/com.example.fl_oac/cache/3512e8c2-1c3a-4eff-84ad-65a761472da16740464865372477574.jpg"
  );
  
  List<DataModel> gente = [];
  bool _isProcessing = false;
  bool _saved = false;

  String _path_foto="/data/user/0/com.example.fl_oac/cache/3512e8c2-1c3a-4eff-84ad-65a761472da16740464865372477574.jpg";

  String get path_foto{
    return this._path_foto;
  }

  bool get saved{
    return this._saved;
  }

  set saved(bool valor){
    this._saved = valor;
    notifyListeners();
  }

  set path_foto(String ruta){
    this._path_foto = ruta;
    this.persona.foto = this._path_foto;
    notifyListeners();
  }

  bool get isProcessing => _isProcessing;

  void set isProcessing(bool valor){
    _isProcessing = valor;
    notifyListeners();
  }

  altaCiudadano(DataModel persona) async{
      //this.saved = true;
      this.isProcessing = true;
      int clave = await DBService.db.nuevoCiudadano(persona);
      persona.id = clave;
      this.gente.add(persona);
      this.isProcessing = false;
      //this.saved = true;
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
