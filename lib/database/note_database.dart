
 import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';


 import 'note_dao.dart';

import 'note_entitty.dart';
part 'note_database.g.dart'; 

 @Database(version: 1, entities: [Note])
 abstract class AppDatabase extends FloorDatabase {
   
   NoteDao get noteDao;
 }