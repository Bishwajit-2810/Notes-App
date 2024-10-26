import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:notes_app/components/notes_tile.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';
import '../components/my_drawer.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final TextEditingController textController = TextEditingController();
  @override
  void initState() {
    readNotes(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void createNote(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text("Enter your note"),
          content: TextField(
            cursorColor: Theme.of(context).colorScheme.inversePrimary,
            controller: textController,
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                context.read<NoteDatabase>().addNote(textController.text);
                textController.clear();
                Navigator.pop(context);
              },
              child: const Text("Create"),
            ),
          ],
        );
      },
    );
  }

  void updateNotes(BuildContext context, Note note) {
    textController.text = note.text;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Update Note"),
          content: TextField(
            cursorColor: Theme.of(context).colorScheme.inversePrimary,
            controller: textController,
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                context
                    .read<NoteDatabase>()
                    .updateNote(note.id, textController.text);
                textController.clear();
                Navigator.pop(context);
              },
              child: const Text("Create"),
            ),
          ],
        );
      },
    );
  }

  void deleteNote(BuildContext context, Note note) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Note"),
          actions: [
            MaterialButton(
              onPressed: () {
                context.read<NoteDatabase>().deleteNote(note.id);

                Navigator.pop(context);
              },
              child: const Text("Delete"),
            ),
          ],
        );
      },
    );
  }

  void readNotes(BuildContext context) {
    context.read<NoteDatabase>().fetchNotes();
  }

  @override
  Widget build(BuildContext context) {
    final noteDatabase = context.watch<NoteDatabase>();

    List<Note> currentNotes = noteDatabase.currentNotes;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () => readNotes(context),
            icon: const Icon(
              Icons.replay_outlined,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createNote(context),
        child: const Icon(Icons.add),
      ),
      drawer: const MyDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Notes",
              style: GoogleFonts.dmSerifText(
                fontSize: 48,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: currentNotes.length,
              itemBuilder: (BuildContext context, int index) {
                return NotesTile(
                  text: currentNotes[index].text,
                  onPressed1: () => updateNotes(context, currentNotes[index]),
                  onPressed2: () => deleteNote(context, currentNotes[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
