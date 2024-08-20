import 'package:flutter/material.dart';
import 'package:news_app_dummy_api/src/core/components/shimmer_container.dart';

class NewsForYouShimmer extends StatelessWidget {
  const NewsForYouShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const ShimmerContainer(height: 120, width: 120),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const ShimmerContainer(
                      height: 28,
                      width: 28,
                    ),
                    const SizedBox(width: 10),
                    ShimmerContainer(
                      height: 20,
                      width: MediaQuery.of(context).size.width / 2.6,
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                ShimmerContainer(
                  height: 15,
                  width: MediaQuery.of(context).size.width / 1.8,
                ),
                const SizedBox(height: 3),
                ShimmerContainer(
                  height: 15,
                  width: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ShimmerContainer(
                      height: 15,
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                    ShimmerContainer(
                      height: 15,
                      width: MediaQuery.of(context).size.width / 4,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
