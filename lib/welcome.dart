import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/Welcome 3.jpg"),
          Image.asset("assets/welcome.png"),
          Image.asset("assets/welcome2.png"),
          Container(
            margin: EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Material(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(50),
              child: InkWell(
                onTap: () {
                  Get.toNamed("/home"); // Navigating to Home page
                },
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Lets gets started',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
