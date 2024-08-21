import 'package:flutter/material.dart';
import 'package:news_app_dummy_api/src/core/components/trending_shimmer_loading.dart';

class ShimmerLoadingTestScreen extends StatelessWidget {
  const ShimmerLoadingTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
           TrendingShimmerLoading()
          ],
        ),
      ),
    );
  }
}
