// import 'package:cartilla_flutter/models/personal_response.dart';
// import 'package:cartilla_flutter/providers/dni_provider.dart';
// import 'package:cartilla_flutter/services/visita_service.dart';
 import 'package:fl_oac/models/data_model.dart';
import 'package:fl_oac/providers/data_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:stylish_dialog/stylish_dialog.dart';

class ScanButton extends StatelessWidget {
   const ScanButton({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
   final providerData = Provider.of<DataFormProvider>(context);


    return FloatingActionButton(
      onPressed: () async {
        String barcodeScanRes;
        // Platform messages may fail, so we use a try/catch PlatformException.
        try {
          barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
          if (barcodeScanRes == '-1') {
            return StylishDialog(
              context: context,
              alertType: StylishDialogType.ERROR,
              titleText: 'Escaneo Cancelado!',
            ).show();
          }

          List<String> array = barcodeScanRes.split('@');
          if (array.length != 9) {
            return StylishDialog(
              context: context,
              alertType: StylishDialogType.ERROR,
              titleText: 'Código No Váido!',
            ).show();
          }
          // StylishDialog errorDialog = StylishDialog(
          //     context: context,
          //     alertType: StylishDialogType.ERROR,
          //     titleText: 'No Empadronado!',
          //     contentText:
          //         "Esta persona no figura en la base de datos del Sistema de Visitas"
          //     );

          // StylishDialog dialog = StylishDialog(
          //   context: context,
          //   alertType: StylishDialogType.PROGRESS,
          //   animationLoop: false,
          //   titleText: 'Procesando...',
          //   dismissOnTouchOutside: false,
          // );
         // dialog.show();
          providerData.persona = DataModel(
            dniNumero: int.parse(array[4]),
            apellido: array[1],
            nombre: array[2],
            sexo: array[3],
            nacimiento: array[6],
            fechaEmisionDni: array[7],
            dniTramite: array[0],
            dniEjemplar : array[5]            
         );
         Navigator.pushNamed(context, 'formulario');

          // String dato_dni = array[4].toString();
          // var servicio = VisitaService();

          // try {
          //   PersonalElement visita = await servicio.getByDni(dato_dni);
          //   dialog.dismiss();
          //   Navigator.pushNamed(context, 'details', arguments: visita);
          // } catch (e) {
          //   dialog.dismiss();
          //   errorDialog.show();
          // }
        } catch (e) {
          barcodeScanRes = 'Failed to get platform version.';
        }
      },
      child: Icon(Icons.center_focus_strong),
    );
  }
}
