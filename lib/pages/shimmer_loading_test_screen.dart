import 'package:flutter/material.dart';
import 'package:news_app_dummy_api/components/shimmer_container.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingTestScreen extends StatelessWidget {
  const ShimmerLoadingTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  ShimmerContainer(height: 120, width: 120),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ShimmerContainer(height: 28, width: 28),

                            const SizedBox(width: 10),
                            ShimmerContainer(
                                height: 20,
                                width: MediaQuery.of(context).size.width/2.6
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        ShimmerContainer(
                            height: 15,
                            width: MediaQuery.of(context).size.width/1.8
                        ),
                        const SizedBox(height: 3),
                        ShimmerContainer(
                            height: 15,
                            width: MediaQuery.of(context).size.width/2
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ShimmerContainer(
                                height: 15,
                                width: MediaQuery.of(context).size.width/4
                            ),
                            ShimmerContainer(
                                height: 15,
                                width: MediaQuery.of(context).size.width/4
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
