import 'package:floor/floor.dart';
import 'package:notepad/database/note_entitty.dart';

@dao
abstract class NoteDao{
  @Query('SELECT * FROM Note')
   Stream<List<Note>> findAllNotes();

   @insert
   Future<void> insertNote(Note note);

}