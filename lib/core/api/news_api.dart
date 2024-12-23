import 'dart:convert';

import 'package:news_app_testing/core/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsApi {
  Future<List<NewsModel>> getNews() async {
    // Fetch news from the server
    const url =
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=76077ad0b71a41669de87a4bdfa7965b";
    final uri = Uri.parse(url);
    final Response = await http.get(uri);
    if (Response.statusCode == 200) {
      final json = jsonDecode(Response.body);
      final articles = json['articles'] as List;
      final news = articles.map((e) {
        return NewsModel(
          author: e["author"]?.toString() ?? 'Unknown',
          description: e["description"]?.toString() ?? 'No description',
          publishedAt: e["publishedAt"]?.toString() ?? 'Unknown date',
          title: e["title"]?.toString() ?? 'No title',
          urlToImage: e["urlToImage"]?.toString() ?? 'No image',
        );
      }).toList();
      return news;
    } else {
      throw Exception("Failed to load news");
    }
    // return [];
  }
// "author": "Zoe Sottile, Ashley R. Williams, Taylor Galgano, Sarah Dewberry",
//             "title": "5 injured after a fleeing driver crashes into a JCPenney at a Texas mall, police say. The suspect is dead - CNN",
//             "description": "A man drove into a Texas mall after a 19-mile police pursuit, striking four people before he was fatally shot by responding law enforcement officers, according to the Texas Department of Public Safety.",
//             "url": "https://www.cnn.com/2024/12/21/us/killeen-mall-texas-crash/index.html",
//             "urlToImage": "https://media.cnn.com/api/v1/images/stellar/prod/still-21220819-573-333-still.jpg?c=16x9&q=w_800,c_fill",
//             "publishedAt": "2024-12-22T02:05:00Z",
//             "content": "A man drove into a Texas mall after a 19-mile police pursuit, striking four people before he was fatally shot by responding law enforcement officers, according to the Texas Department of Public Safet… [+2699 chars]"
}
