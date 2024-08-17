import 'package:flutter/material.dart';
import 'package:news_app_dummy_api/pages/article/widgets/search_widget.dart';
import 'package:news_app_dummy_api/pages/home/widgets/news_for_you_tile.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: [
              SearchWidget(),
              SizedBox(height: 20),
             Column(
               children: [
                 NewsForYouTile(
                     imageUrl:
                     "https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/3.Bangladesh_quota_reform_movement_2024.jpg/1280px-3.Bangladesh_quota_reform_movement_2024.jpg",
                     title:
                     "The 2024 Bangladesh quota reform movement was a series of anti-government[e] and pro-democracy[f] protests in Bangladesh,"
                         " spearheaded primarily by university students.",
                     author: "Jamuna News",
                     time: "8 Days ago"),
                 NewsForYouTile(
                     imageUrl:
                     "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/7.Bangladesh_quota_reform_movement_2024.jpg/1280px-7.Bangladesh_quota_reform_movement_2024.jpg",
                     title:
                     "The 2024 Bangladesh quota reform movement was a series of anti-government[e] and pro-democracy[f] protests in Bangladesh,"
                         " spearheaded primarily by university students.",
                     author: "Jamuna News",
                     time: "8 Days ago"),
                 NewsForYouTile(
                     imageUrl:
                     "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/7.Bangladesh_quota_reform_movement_2024.jpg/1280px-7.Bangladesh_quota_reform_movement_2024.jpg",
                     title:
                     "The 2024 Bangladesh quota reform movement was a series of anti-government[e] and pro-democracy[f] protests in Bangladesh,"
                         " spearheaded primarily by university students.",
                     author: "Jamuna News",
                     time: "8 Days ago"),
                 NewsForYouTile(
                     imageUrl:
                     "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/7.Bangladesh_quota_reform_movement_2024.jpg/1280px-7.Bangladesh_quota_reform_movement_2024.jpg",
                     title:
                     "The 2024 Bangladesh quota reform movement was a series of anti-government[e] and pro-democracy[f] protests in Bangladesh,"
                         " spearheaded primarily by university students.",
                     author: "Jamuna News",
                     time: "8 Days ago"),
                 NewsForYouTile(
                     imageUrl:
                     "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/7.Bangladesh_quota_reform_movement_2024.jpg/1280px-7.Bangladesh_quota_reform_movement_2024.jpg",
                     title:
                     "The 2024 Bangladesh quota reform movement was a series of anti-government[e] and pro-democracy[f] protests in Bangladesh,"
                         " spearheaded primarily by university students.",
                     author: "Jamuna News",
                     time: "8 Days ago"),
                 NewsForYouTile(
                     imageUrl:
                     "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/7.Bangladesh_quota_reform_movement_2024.jpg/1280px-7.Bangladesh_quota_reform_movement_2024.jpg",
                     title:
                     "The 2024 Bangladesh quota reform movement was a series of anti-government[e] and pro-democracy[f] protests in Bangladesh,"
                         " spearheaded primarily by university students.",
                     author: "Jamuna News",
                     time: "8 Days ago"),
               ],
             )

            ],
          ),
        ),
      ),
    );
  }
}
