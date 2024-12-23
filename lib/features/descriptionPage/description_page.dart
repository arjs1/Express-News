import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app_testing/core/model/news_model.dart';
import 'package:news_app_testing/core/provider/news_provider.dart';
import 'package:news_app_testing/core/constant/theme_provided.dart';
import 'package:provider/provider.dart';

class DescriptionPage extends StatefulWidget {
  final NewsModel news;
  const DescriptionPage({
    super.key,
    required this.news,
  });
  void addtofavo(BuildContext context) {
    context.read<NewsProvider>().addFavouriteNews(news);
  }

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeProvided.primaryColor,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Description'.toUpperCase(),
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.news.urlToImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Text(widget.news.publishedAt,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    )),
                Text(
                  widget.news.title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 2),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 131, 131, 131),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(widget.news.description,
                        style: GoogleFonts.poppins(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        )),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: MaterialButton(
                    color: ThemeProvided.primaryColor,
                    onPressed: () => widget.addtofavo(context),
                    child: !provider.isExist(widget.news)
                        ? Text(
                            'Add to Favourite',
                            style: GoogleFonts.poppins(color: Colors.white),
                          )
                        : Text(
                            'Remove from Favourite',
                            style: GoogleFonts.poppins(color: Colors.white),
                          ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
