import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewsDetailsPage extends StatelessWidget {
  const NewsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_back_ios_new_outlined),
                          Text("Back")
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://t4.ftcdn.net/jpg/05/65/52/61/360_F_565526112_dfCgD9rs0hEH2N0pNBp5Y0cyhTeLWaxT.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "আমাদের জল সংরক্ষণ করা উচিত এবং এটি দূষিত করা উচিত নয় যাতে এটি ভবিষ্যতের প্রজন্মের জন্যও উপলব্ধ থাকে।"
                        " আমাদের পানির অপচয় বন্ধ করা উচিত এবং এটি সঠিকভাবে ব্যবহার করা উচিত জলের যথাযথ মানও বজায় রাখা। জল পৃথিবীতে আল্লাহর "
                        " মূল্যবান উপহার। পানির সহজলভ্যতার কারণে পৃথিবীতে জীবন বিদ্যমান.",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "2 days ago * Tech",
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "Riyazur Rohman Kawchar",
                      style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).secondaryHeaderColor),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                          "when an unknown printer took a galley of type and scrambled it to make a type specimen book."
                          " It has survived not only five centuries, but also the leap into electronic typesetting,"
                          " remaining essentially unchanged."),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
