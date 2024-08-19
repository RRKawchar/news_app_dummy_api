import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_dummy_api/controller/news_controller.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());

    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
              child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                hintText: "Search book....",
                //prefixIcon: Icon(Icons.search),
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                border: InputBorder.none),
          )),
          Obx(
            () => newsController.isTechCrunchNewsLoading.value
                ? Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).colorScheme.primary),
                    child: CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.onBackground,
                    ))
                : InkWell(
                    onTap: () {
                      newsController.searchNews(textEditingController.text);
                      FocusScope.of(context).unfocus();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Theme.of(context).colorScheme.primary),
                      child: const Icon(Icons.search),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
