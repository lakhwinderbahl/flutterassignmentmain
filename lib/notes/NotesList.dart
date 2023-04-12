import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mdev/notes/EditNote.dart';

import 'NotesController.dart';

class NotesList extends StatelessWidget {
  NotesList({Key? key}) : super(key: key);
  final notesController = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Notes List"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Get.toNamed("/addNote");
        },
      ),
      body: Obx(
        () => ListView.builder(
          itemBuilder: (context, index) => Column(
            children: [
              Card(
                elevation: 9,
                child: ListTile(
                  title: Text(
                    notesController.notes[index].text!,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  trailing: IconButton(
                    /**
                     * Navigating to Edit notes screen
                     * and passing the index as parameter
                     */
                    onPressed: () => Get.to(() => EditNote(index: index)),
                    icon: const Icon(
                      Icons.note_alt_outlined,
                      color: Colors.deepOrangeAccent
                    ),
                  ),
                ),
              ),
            ], // Children
          ),
          itemCount: notesController.notes.length
        ),
      ),
    );
  }
}
