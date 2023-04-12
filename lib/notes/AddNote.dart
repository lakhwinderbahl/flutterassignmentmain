import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'NoteModel.dart';
import 'NotesController.dart';

class AddNote extends StatelessWidget {
  final  notesController = Get.put(NotesController());

  final TextEditingController textEditingController = TextEditingController();

  AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Add Note"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Card(
              elevation: 9,
              child: TextField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(9),
                  hintText: "Type here",
                  focusedBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                autofocus: true,
                controller: textEditingController,
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepOrangeAccent,
                    textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                child: const Text('Add'),
                onPressed: () {
                  if(textEditingController.text.isNotEmpty){
                    /**
                     * Adding notes to the notesList
                     */
                    notesController.notes.add(
                      NoteModel(
                        text: textEditingController.text,
                      ),
                    );
                    Get.back(); // After adding a new note, go back to previous screen.
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}