
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'NewsController.dart';
import 'newsModel.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  // Initializing the news controller.
  final controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: Text("News"),
        actions:   [
          InkWell(
            onTap: (){
              controller.fetchNews(); // Fetching latest news on click of refresh button.
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.refresh),
            ),
          )
        ],
      ),
      body: Obx(() => controller.isLoading.value ? const Center(child: CircularProgressIndicator()) : ListView.builder(
        itemCount: controller.newsList.length,
        itemBuilder: (context, index) {
          Articles item = controller.newsList.value[index];
          return InkWell(
            onTap: () {
              controller.setSelected(index); // Setting the index of currently selected news
            },
            child: Card(
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    (item.urlToImage != null)
                        ? Image.network(
                      item.urlToImage!,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width / 2,
                      fit: BoxFit.fill,
                    )
                        : Container(),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.title ?? "N/A",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      item.description ?? "N/A",
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
