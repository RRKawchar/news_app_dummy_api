import 'package:flutter/material.dart';
import 'package:news_app_dummy_api/pages/home/widgets/news_for_you_tile.dart';
import 'package:news_app_dummy_api/pages/home/widgets/trending_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News Views",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hottest News",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TrendingCard(
                      imageUrl:
                          "https://t4.ftcdn.net/jpg/05/65/52/61/360_F_565526112_dfCgD9rs0hEH2N0pNBp5Y0cyhTeLWaxT.jpg",
                      title:
                          "আমাদের জল সংরক্ষণ করা উচিত এবং এটি দূষিত করা উচিত নয় যাতে এটি ভবিষ্যতের প্রজন্মের জন্যও উপলব্ধ থাকে।"
                          " আমাদের পানির অপচয় বন্ধ করা উচিত এবং এটি সঠিকভাবে ব্যবহার করা উচিত জলের যথাযথ মানও বজায় রাখা। জল পৃথিবীতে আল্লাহর "
                          " মূল্যবান উপহার। পানির সহজলভ্যতার কারণে পৃথিবীতে জীবন বিদ্যমান.",
                      author: "Riyazur Rohman Kawchar",
                      tag: "Trending no 1",
                      time: "2 Days ago",
                    ),
                    TrendingCard(
                      imageUrl:
                          "https://images.hindustantimes.com/bangla/img/2024/08/15/600x338/Mushfiq_1723714314486_1723714328562.jpg",
                      title:
                          "PAK vs BAN Test: ঝুঁকি নিতে রাজি নয় PCB, দর্শকশূন্য স্টেডিয়ামে পাকিস্তান-বাংলাদেশ দ্বিতীয় টেস্ট",
                      author: "DBC News",
                      tag: "Trending no 2",
                      time: "3 Days ago",
                    ),
                    TrendingCard(
                      imageUrl:
                          "https://ichef.bbci.co.uk/news/1024/cpsprodpb/d3ee/live/bfd05710-5bf2-11ef-b970-9f202720b57a.jpg.webp",
                      title:
                          "Mediators in talks on a new Gaza ceasefire and hostage release deal say they have presented a proposal which “narrows the gaps” between Israel and Hamas.",
                      author: "Gaza News",
                      tag: "Trending no 3",
                      time: "1 min ago",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News For You",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "See All",
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Column(
                children: [
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              height: 60,
              width: 200,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(100)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Icon(
                        Icons.home,
                        size: 25,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        // color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Icon(
                        Icons.book,
                        size: 25,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        // color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(100)
                    ),
                    child: Center(
                      child: Icon(
                        Icons.settings,
                        size: 25,
                        color: Theme.of(context).colorScheme.secondaryContainer,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
