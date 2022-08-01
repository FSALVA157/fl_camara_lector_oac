import 'package:fl_oac/models/data_model.dart';
import 'package:flutter/material.dart';

class DataFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  final DataModel? data;

  DataFormProvider({this.data});

  // updateAvailable(bool valor){
  //    this.producto.available = valor;
     
  //     notifyListeners();     
  // }


  bool isValid(){
    return formKey.currentState?.validate() ?? false;
  }

  
}
