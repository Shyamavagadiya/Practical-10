import 'package:flutter/material.dart';
import 'note_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotesScreen(),
    );
  }
}

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<Note> _notes = [];

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  void _addNote() {
    setState(() {
      _notes.add(Note(
        title: _titleController.text,
        content: _contentController.text,
      ));
    });

    _titleController.clear();
    _contentController.clear();
  }

  void _editNote(int index) {
    setState(() {
      _notes[index] = Note(
        title: _titleController.text,
        content: _contentController.text,
      );
    });

    _titleController.clear();
    _contentController.clear();
  }

  void _deleteNote(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: 'Title'),
            ),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(hintText: 'Content'),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _addNote,
                  child: Text('Add Note'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    _editNote(0); // This is for editing a note at index 0 (for example)
                  },
                  child: Text('Edit Note'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _notes.length,
                itemBuilder: (ctx, index) {
                  final note = _notes[index];
                  return ListTile(
                    title: Text(note.title),
                    subtitle: Text(note.content),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _deleteNote(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
