import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mdev/news/newsModel.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsController extends GetxController {
  RxList newsList = [].obs;
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    fetchNews(); // Fetching the news on init
    super.onInit();
  }

  void setSelected(index) {
    selectedIndex(index); // Setting the index of selected news.
    Get.toNamed("/newsDetails"); // Navigating to news details page.
  }

  Articles getSelectedArticle() {
    return newsList[selectedIndex.value]; // Fetching the news from newsList using the selected index.
  }

  void fetchNews() async {
    isLoading(true);
    /**
     * Fetching the news using API
     */
    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json'
    };
    const url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=7502218d123b407b92e37ee5c21c8b2f";
    http.Response res = await http.get(Uri.parse(url), headers: headers);
    NewsResponse response = NewsResponse.fromJson(jsonDecode(res.body));
    if (response.articles != null) {
      newsList.assignAll(response.articles!);
    }
    isLoading(false);
  }

  Future<void> openUrl(url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {}
  }
}
