import 'dart:io';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:fl_oac/models/data_model.dart';
export 'package:fl_oac/models/data_model.dart';

class DBService{

  static Database? _database;

  DBService._();
  static final DBService db = DBService._();

  Future<Database> get database async{
    print('INGRESANDO A GET DE DATABASE');
    if(_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  Future<Database> initDB() async{
      //definimos el path de la aplicacion y la db
      Directory documentsDirectory = await getApplicationDocumentsDirectory();
      final path = p.join(documentsDirectory.path, "CiudadanosDB.db");
      print(path);

      //creamos la db
      return await openDatabase(
        path,
        version: 4,
        onOpen: (db)async{
          print('IMPRIMIENDO LA VERSION');
          print(await db.getVersion());
        },
        onCreate: (Database db, int version)async{
            await db.execute('''
                  CREATE TABLE personas(
                    id INTEGER PRIMARY KEY,
                    dniNumero INTEGER UNIQUE,
                    dniTramite TEXT,
                    nacimiento TEXT,
                    apellido TEXT,
                    nombre TEXT,
                    sexo TEXT,
                    dniEjemplar TEXT
                    fechaEmisionDni  TEXT,
                    foto TEXT,
                  )
                    ''');
        }
        );

      
  }

  Future<int> nuevoScan(DataModel nuevoScan)async{
      //verficar la base de datos
      final db = await database;
      //carguemos los datos
      final res = await db.insert('personas', nuevoScan.toJson());
      print(res);
      return res;
  }
}