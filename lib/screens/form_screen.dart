import 'package:fl_oac/providers/data_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
   
  const FormScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    

    return  Scaffold(
      body: Center(
         child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 10,),
              CardContainer(
                child: _DataForm()
                )
              
              
            ],
          ),
         ),
      ),
    );
  }
}

class _DataForm extends StatelessWidget {
  const _DataForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<DataFormProvider>(context);
    

    return Container(
      child: Form(
        key: dataProvider.formKey,
        child: Column(
            children: [
              _CustomInputField(
                initialValue: dataProvider.persona.dniNumero.toString(),
                helperText:  'el D.N.I es un número entero',
                hintText:  'ingrese el dni',
                labelText:  'D.N.I.', 
                icon:  Icons.assignment_ind_rounded,
                suffixIcon:  Icons.confirmation_number_outlined,
                formProperty:  'dniNumero',
                //formValues: obj,
                onChanged: (value){
                  try {
                    dataProvider.persona.dniNumero = int.parse(value);                    
                  } catch (e) {
                    dataProvider.persona.dniNumero = 0;                    
                  }
                },
                validator: (value){
                    if(value ==  null) return  'Este campo es Obligatorio';
                    return value.length <  7?  'El DNI debe ser válido y sin puntos':  null;
                    },
                ),
                const  SizedBox(height:  30,),
                _CustomInputField(
                initialValue: dataProvider.persona.dniTramite ?? "",
                helperText:  'el Número de Trámite es un texto',
                hintText:  'ingrese el Nº de Trámite',
                labelText:  'Trámite D.N.I.', 
                icon:  Icons.build,
                suffixIcon:  Icons.api,
                formProperty:  'dniTramite',
                //formValues: obj,
                onChanged: (value){
                  try {
                    dataProvider.persona.dniTramite = value;                    
                  } catch (e) {
                    dataProvider.persona.dniTramite = "";                    
                  }
                },
                validator: (value){
                    return value.length <  8?  'El Trámite debe ser válido y sin puntos':  null;
                    },
                ),
                const  SizedBox(height:  30,),
              _CustomInputField(
                initialValue: dataProvider.persona.nacimiento,
                helperText:  'Fecha de Nacimiento del Empadronado',
                hintText:  'ingrese Fecha de Nacimiento',
                labelText:  'Fecha de Nacimiento', 
                icon:  Icons.cake_sharp,
                suffixIcon:  Icons.card_giftcard_outlined,
                formProperty:  'nacimiento',
                //formValues: obj,
                onChanged: (value){
                  try {
                    dataProvider.persona.nacimiento = value;                    
                  } catch (e) {
                    dataProvider.persona.nacimiento = "";                    
                  }
                },
                validator: (value){
                    if(value ==  null) return  'Este campo es Obligatorio';
                    return value.length <  8?  'La fecha de nacimiento debe ser válida':  null;
                    },
                ),
                const  SizedBox(height:  30,),
              _CustomInputField(
                initialValue: dataProvider.persona.apellido,
                helperText:  'Apellido del Empadronado',
                hintText:  'ingrese el Apellido',
                labelText:  'Apellido', 
                icon:  Icons.text_decrease,
                suffixIcon:  Icons.text_fields,
                formProperty:  'apellido',
                //formValues: obj,
                onChanged: (value){
                  try {
                    dataProvider.persona.apellido = value;                    
                  } catch (e) {
                    dataProvider.persona.apellido = "";                    
                  }
                },
                validator: (value){
                    if(value ==  null) return  'Este campo es Obligatorio';
                    return value.length <  2?  'El Apellido debe ser válido':  null;
                    },
                ),
                const  SizedBox(height:  30,),
                _CustomInputField(
                initialValue: dataProvider.persona.nombre,
                helperText:  'Nombre del Empadronado',
                hintText:  'ingrese el nombre',
                labelText:  'Nombre', 
                icon:  Icons.textsms,
                suffixIcon:  Icons.text_format,
                formProperty:  'nombre',
                //formValues: obj,
                onChanged: (value){
                  try {
                    dataProvider.persona.nombre = value;                    
                  } catch (e) {
                    dataProvider.persona.nombre = "";                    
                  }
                },
                validator: (value){
                    if(value ==  null) return  'Este campo es Obligatorio';
                    return value.length <  2?  'El nombre debe ser válido':  null;
                    },
                ),
                const  SizedBox(height:  30,),
                _CustomInputField(
                initialValue: dataProvider.persona.sexo,
                helperText:  'Sexo del Empadronado',
                hintText:  'ingrese el sexo',
                labelText:  'Sexo', 
                icon:  Icons.center_focus_strong_rounded,
                suffixIcon:  Icons.close_fullscreen_rounded,
                formProperty:  'sexo',
                //formValues: obj,
                onChanged: (value){
                  try {
                    dataProvider.persona.sexo = value;                    
                  } catch (e) {
                    dataProvider.persona.sexo = "";                    
                  }
                },
                validator: (value){
                    if(value ==  null) return  'Este campo es Obligatorio';
                    return value.length <  2?  'El sexo debe ser válido':  null;
                    },
                ),
                const  SizedBox(height:  30,),
                _CustomInputField(
                initialValue: dataProvider.persona.dniEjemplar ?? "",
                helperText:  'Ejemplar D.N.I.',
                hintText:  'ingrese el ejemplar de D.N.I.',
                labelText:  'Ejemplar D.N.I.', 
                icon:  Icons.ballot_sharp,
                suffixIcon:  Icons.ballot_outlined,
                formProperty:  'dniEjemplar',
                //formValues: obj,
                onChanged: (value){
                  try {
                    dataProvider.persona.dniEjemplar = value;                    
                  } catch (e) {
                    dataProvider.persona.dniEjemplar = "";                    
                  }
                },
                validator: (value){
                    return value.length <  2?  'El ejemplar DNI debe ser válido':  null;
                    },
                ),
              const  SizedBox(height:  30,),
                _CustomInputField(
                initialValue: dataProvider.persona.fechaEmisionDni ?? "",
                helperText:  'Fecha de Emisión del D.N.I.',
                hintText:  'ingrese Fecha de Emisión del D.N.I.',
                labelText:  'Fecha de Emisión D.N.I.', 
                icon:  Icons.dataset,
                suffixIcon:  Icons.dataset_outlined,
                formProperty:  'fechaEmisionDni',
                //formValues: obj,
                onChanged: (value){
                  try {
                    dataProvider.persona.fechaEmisionDni = value;                    
                  } catch (e) {
                    dataProvider.persona.fechaEmisionDni = "";                    
                  }
                },
                validator: (value){
                    return value.length <  2?  'La fecha de Emision DNI debe ser válida':  null;
                    },
                ),
              const  SizedBox(height:  100,),

            ],          
        )
        ),
    );
  }
}

class _CustomInputField extends StatelessWidget {
final String initialValue;
final  String? hintText;
final  String? labelText;
final  String? helperText;
final  IconData? icon;
final  IconData? suffixIcon;
final  TextInputType? keyboardType;
final  bool obscureText;
final  TextCapitalization textCapitalization;
final  String formProperty;
//final  Map<String, String> formValues;
final Function onChanged;
final Function validator;

const  _CustomInputField({
Key? key, this.hintText, this.labelText, this.helperText, this.icon, this.suffixIcon,
this.keyboardType, this.obscureText=false, this.textCapitalization=TextCapitalization.none, required  this.formProperty, required this.onChanged, required this.initialValue, required this.validator}) :  super(key: key);




  @override
  Widget build(BuildContext context) {
    return TextFormField(
        //autofocus: true,
        initialValue: this.initialValue,
        keyboardType: (this.keyboardType ==  null)?  null:  this.keyboardType,
        obscureText:  this.obscureText,
        textCapitalization: (this.textCapitalization ==  null)?  TextCapitalization.words:  this.textCapitalization,
        onChanged: (value) => this.onChanged(value),
        validator: (value)=>this.validator(value),
        autovalidateMode:  AutovalidateMode.onUserInteraction,
        decoration:  InputDecoration(
        hintText:  this.hintText,
        labelText:  this.labelText,
        helperText:  this.helperText,
        icon:  this.icon ==  null?  null:  Icon(this.icon),
        suffixIcon:  this.suffixIcon ==  null?  null:  Icon(this.suffixIcon)        
        ));
  }
}

class CardContainer extends StatelessWidget {
  final Widget child;
   
  const CardContainer({Key? key, required this.child}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          decoration: _decorationCard(),
          child: this.child,
      ),
    );
  }

BoxDecoration _decorationCard() =>  BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    color: Colors.white,
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0, 5)
      )
    ]
  );
}
