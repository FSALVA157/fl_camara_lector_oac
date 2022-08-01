import 'package:fl_oac/providers/data_form_provider.dart';
import 'package:fl_oac/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanScreen extends StatelessWidget {
   
  const ScanScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final dataFormProvider = Provider.of<DataFormProvider>(context);
    
    return  Scaffold(
         body: Center(
         child: FondoBienvenida(),
      ),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}