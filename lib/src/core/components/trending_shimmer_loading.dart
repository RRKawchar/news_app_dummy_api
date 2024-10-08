import 'package:flutter/material.dart';
import 'package:news_app_dummy_api/src/core/components/shimmer_container.dart';

class TrendingShimmerLoading extends StatelessWidget {
  const TrendingShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(5),
      width: 280,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainer(
            height: 200,
            width: MediaQuery.of(context).size.width,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerContainer(
                height: 20,
                width: MediaQuery.of(context).size.width/4,
              ),
              ShimmerContainer(
                height: 20,
                width: MediaQuery.of(context).size.width/4,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [

              ShimmerContainer(
                height: 28,
                width: MediaQuery.of(context).size.width/1.6,
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              ShimmerContainer(
                height: 28,
                width: MediaQuery.of(context).size.width/1.8,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              const ShimmerContainer(
                height: 35,
                width: 35,
              ),

              const SizedBox(width: 10),
              ShimmerContainer(
                height: 30,
                width: MediaQuery.of(context).size.width/2,
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
