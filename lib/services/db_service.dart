import 'package:sqflite/sqflite.dart';

class DBService{

  static Database _database;

  DBService._();
  static final DBService db = DBService._();

  Future<Database> get database async{
    if(_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  Future<Database> initDB() async{

  }

}