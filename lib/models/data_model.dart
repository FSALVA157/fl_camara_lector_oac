class DataModel {
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

}
