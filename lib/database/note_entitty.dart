import 'package:floor/floor.dart';

@entity
class Note{
  @PrimaryKey(autoGenerate:true) 
  final int id;
 final String noteTitle;
 final String noteDesc;
 final String currentDate;

  Note(this.id,this.noteTitle, this.noteDesc, this.currentDate);

 

 

  
  }
  