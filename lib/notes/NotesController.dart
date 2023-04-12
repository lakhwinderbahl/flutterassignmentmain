import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'NoteModel.dart';

class NotesController extends GetxController {
  RxList notes = List<NoteModel>.empty().obs;

  @override
  void onInit() {
    // Fetching all the notes stored in storage.
    List? storedNotes = GetStorage().read<List>('notes');
    if (storedNotes != null) {
      notes = storedNotes.map((e) => NoteModel.fromJson(e)).toList().obs;
    }
    /**
     * Everytime notes list is editted this function will be called.
     */
    ever(notes, (_) {
      // Saving the updated notes to storage
      GetStorage().write('notes', notes.toList());
    });
    super.onInit();
  }
}