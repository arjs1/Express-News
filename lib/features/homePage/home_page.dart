import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:news_app_testing/core/provider/news_provider.dart';
import 'package:news_app_testing/features/homePage/carousel_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<NewsProvider>(context, listen: false).getAllNews();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NewsProvider>(
        builder: (context, value, child) {
          if (value.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final news = value.newsList;
          if (news.isEmpty) {
            return Center(
              child: Text('No news available'),
            );
          }
          return Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Text(
                      "Express News",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color.fromARGB(255, 43, 136, 46),
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 8,
              ),
              CarouselWidget(news: news),
            ],
          );
        },
      ),
    );
  }
}
