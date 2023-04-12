import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("Homescreen"),
        centerTitle: true,
      ),
      body: Row(
        children: [
          SizedBox(
          width:  MediaQuery.of(context).size.width / 2,
          height:MediaQuery.of(context).size.width / 2,
          child: InkWell(
            onTap: (){
              Get.toNamed("/news"); // Navigate to News Screen
            },
            child: Card(
              elevation: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Icon(Icons.newspaper, color: Colors.deepOrangeAccent, size: 48),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("News", style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent)),
                )],
              ),
            ),
          ),
        ),
          SizedBox(
            width:  MediaQuery.of(context).size.width / 2,
            height:MediaQuery.of(context).size.width / 2,
            child:  InkWell(
              onTap: (){
                Get.toNamed("/notesList"); // Navigate to Notes List Screen
              },
              child: Card(
                elevation: 20,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [Icon(Icons.notes, color: Colors.deepOrangeAccent, size: 48),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Notes", style: TextStyle(fontSize: 16, color: Colors.deepOrangeAccent)),
                    )],
                ),
              ),
            ),
          )],
      ),
    );
  }
}
