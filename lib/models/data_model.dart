import 'dart:convert';

DataModel dataModelFromJson(String str) => DataModel.fromJson(json.decode(str));

String dataModelToJson(DataModel data) => json.encode(data.toJson());

class DataModel {
  int? id;
  int dniNumero;      
  String? dniTramite;     
  String nacimiento;  
  String apellido;    
  String nombre;      
  String sexo;        
  String? dniEjemplar;    
  String? fechaEmisionDni;
  String? foto;

  DataModel({
    this.id,
    required this.dniNumero,
    this.dniTramite,
    required this.nacimiento,
    required this.apellido,
    required this.nombre,
    required this.sexo,
    this.dniEjemplar,
    this.fechaEmisionDni,
    this.foto
    }){}

    factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
        id: json["id"],
        dniNumero: json["dniNumero"],
        dniTramite: json["dniTramite"],
        nacimiento: json["nacimiento"],
        apellido: json["apellido"],
        nombre: json["nombre"],
        sexo: json["sexo"],
        dniEjemplar: json["dniEjemplar"],
        fechaEmisionDni: json["fechaEmisionDni"],
        foto: json["foto"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "dniNumero": dniNumero,
        "dniTramite": dniTramite,
        "nacimiento": nacimiento,
        "apellido": apellido,
        "nombre": nombre,
        "sexo": sexo,
        "dniEjemplar": dniEjemplar,
        "fechaEmisionDni": fechaEmisionDni,
        "foto": foto,
    };

     
}

