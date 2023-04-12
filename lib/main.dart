import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mdev/news/newsDetails.dart';
import 'package:mdev/notes/AddNote.dart';
import 'package:mdev/welcome.dart';

import 'Home.dart';
import 'news/NewsScreen.dart';
import 'notes/EditNote.dart';
import 'notes/NotesList.dart';

main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'MDEV Flutter',
        initialRoute: "/",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        /**
         * Defining all routes.
         */
        routes: {
          '/': (BuildContext context) {
            return Welcome();
          },
          '/home': (BuildContext context) {
            return Home();
          },
          '/news': (BuildContext context) {
            return NewsScreen();
          },
          '/newsDetails': (BuildContext context) {
            return NewsDetails();
          },
          '/notesList': (BuildContext context) {
            return NotesList();
          },
          '/addNote': (BuildContext context) {
            return AddNote();
          },
          '/editNotes': (BuildContext context) {
            return EditNote();
          }
        });
  }
}
