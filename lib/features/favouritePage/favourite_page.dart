import 'package:flutter/material.dart';
import 'package:news_app_testing/core/provider/news_provider.dart';
import 'package:news_app_testing/features/descriptionPage/description_page.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    final favouriteData = context.watch<NewsProvider>().favouriteNews;
    return Scaffold(
      body: ListView.builder(
        itemCount: favouriteData.length,
        itemBuilder: (context, index) {
          final newsFavourite = favouriteData[index];
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DescriptionPage(news: newsFavourite),
                    ),
                  );
                },
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(favouriteData[index].urlToImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        favouriteData[index].title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
