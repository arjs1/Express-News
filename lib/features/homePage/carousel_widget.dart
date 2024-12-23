// import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_testing/core/model/news_model.dart';
import 'package:news_app_testing/features/descriptionPage/description_page.dart';

class CarouselWidget extends StatelessWidget {
  final List<NewsModel> news;
  const CarouselWidget({
    super.key,
    required this.news,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CarouselSlider.builder(
        itemCount: news.length,
        itemBuilder: (BuildContext context, int index, int realIndex) {
          final newsList = news[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DescriptionPage(
                    news: newsList,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    image: NetworkImage(newsList.urlToImage),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                          ),
                        ),
                        child: Column(
                          spacing: 5,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              newsList.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              newsList.publishedAt,
                              style: GoogleFonts.poppins(color: Colors.white),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 250.0,
          // autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: false,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          viewportFraction: 1,
        ),
      ),
    );
  }
}
