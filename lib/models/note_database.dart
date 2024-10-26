import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:notes_app/models/note.dart';
import 'package:path_provider/path_provider.dart';

class NoteDatabase extends ChangeNotifier {
  static late Isar isar;

  //initialize isar database
  static Future<void> initialize() async {
    final dir = await getApplicationCacheDirectory();
    isar = await Isar.open([NoteSchema], directory: dir.path);
  }

  //list of notes
  final List<Note> currentNotes = [];

  //creating new note
  Future<void> addNote(String text) async {
    final newNote = Note();
    newNote.text = text;

    //save to db
    await isar.writeTxn(() => isar.notes.put(newNote));

    //read from db
    fetchNotes();
  }

  //read notes  from db
  Future<void> fetchNotes() async {
    List<Note> fetchedNotes = await isar.notes.where().findAll();
    currentNotes.clear();
    currentNotes.addAll(fetchedNotes);
    notifyListeners();
  }

  //update notes in db
  Future<void> updateNote(int id, String newTask) async {
    final existingNotes = await isar.notes.get(id);
    if (existingNotes != null) {
      existingNotes.text = newTask;
      await isar.writeTxn(() => isar.notes.put(existingNotes));
      await fetchNotes();
    }
  }

  //delete from db
  Future<void> deleteNote(int id) async {
    await isar.writeTxn(() => isar.notes.delete(id));
    await fetchNotes();
  }
}
