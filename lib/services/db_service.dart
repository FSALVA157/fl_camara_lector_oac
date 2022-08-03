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
        version: 1,
        onOpen: (db)async{
          print('IMPRIMIENDO LA VERSION');
          print(await db.getVersion());
          //  await db.execute('''
          //     CREATE TABLE ciudadanos(
          //     id INTEGER PRIMARY KEY,
          //     dniNumero INTEGER,
          //     dniTramite TEXT,
          //     nacimiento TEXT,
          //     apellido TEXT,
          //     nombre TEXT,
          //     sexo TEXT,
          //     dniEjemplar TEXT,
          //     fechaEmisionDni TEXT,
          //     foto TEXT
          //     )
          //     ''');
           
        //onCreate: (Database db, int version)async{
        //    await db.execute('''
        //       CREATE TABLE ciudadanos(
        //       id INTEGER PRIMARY KEY,
        //       dniNumero INTEGER UNIQUE,
        //       dniTramite TEXT,
        //       nacimiento TEXT,
        //       apellido TEXT,
        //       nombre TEXT,
        //       sexo TEXT,
        //       dniEjemplar TEXT,
        //       fechaEmisionDni TEXT,
        //       foto TEXT
        //       )
        //       ''');
        // },

        }
        );

      
  }

  Future<int> nuevoCiudadano(DataModel nuevoCiudadano)async{
      //verficar la base de datos
      final db = await database;
      //carguemos los datos
      final res = await db.insert('ciudadanos', nuevoCiudadano.toJson());
      
      return res;
  }

  dropTable(String tableName)async{
    final db = await database;
     await db.execute('''
      DROP TABLE ${tableName}
      ''');
  }

  Future<DataModel?> getOneCiudadanobyId(int id)async{
    final db = await database;
    final res = await db.query('ciudadanos',where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty
            ? DataModel.fromJson(res.first)
            : null;
  }

  Future<List<DataModel>> getAllCiudadano()async{
    final db = await database;

    final res = await db.query('ciudadanos');

    final List<DataModel> lista =  res.isNotEmpty
        ? res.map((e) => DataModel.fromJson(e)).toList()
        :[];
    
    return lista;
  }

  Future<int> updateCiudadano(DataModel nuevaData) async{
    final db = await database;

    final res = await db.update('ciudadanos', nuevaData.toJson(), where: "id=?", whereArgs: [nuevaData.id]);

    return res;
  }

  Future<int> deleteCiudadano(int id)async{
    final db = await database;
    final res = await db.delete('ciudadanos', where: "id =?", whereArgs: [id]);
    return res;
  }

  Future<int> deleteAllCiudadanos()async{
      final db = await database;

      final res = await db.rawDelete('''
              DELETE FROM ciudadanos
              ''');
      return res;
  }




}