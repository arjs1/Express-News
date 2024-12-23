import 'package:flutter/material.dart';
import 'package:news_app_testing/core/api/news_api.dart';
import 'package:news_app_testing/core/model/news_model.dart';

class NewsProvider extends ChangeNotifier {
  final _newsprovider = NewsApi();
  bool isLoading = false;
  List<NewsModel> _newsList = [];
  List<NewsModel> get newsList => _newsList;
  List<NewsModel> _favouriteNews = [];
  List<NewsModel> get favouriteNews => _favouriteNews;

  Future<void> getAllNews() async {
    isLoading = true;
    notifyListeners();
    _newsList = await _newsprovider.getNews();

    isLoading = false;
    notifyListeners();
  }

  void addFavouriteNews(NewsModel news) {
    // _favouriteNews.add(news);
    // notifyListeners();

    final isExist = _favouriteNews.contains(news);
    if (isExist) {
      _favouriteNews.remove(news);
    } else {
      _favouriteNews.add(news);
    }

    notifyListeners();
  }

  bool isExist(NewsModel item) {
    final isExist = _favouriteNews.contains(item);
    return isExist;
  }
}
