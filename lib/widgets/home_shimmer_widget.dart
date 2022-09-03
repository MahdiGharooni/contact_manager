import 'package:contact_manager/widgets/shimmer_container.dart';
import 'package:flutter/material.dart';

class HomeShimmerWidget extends StatelessWidget {
  const HomeShimmerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Row(
          children: [
            const ShimmerContainer(
              width: 50,
              height: 50,
              borderRadius: 100,
            ),
            const SizedBox(width: 24),
            Column(
              children: const [
                ShimmerContainer(
                  height: 10,
                  width: 100,
                  borderRadius: 8,
                ),
                SizedBox(width: 8),
                ShimmerContainer(
                  height: 10,
                  width: 70,
                  borderRadius: 8,
                  margin: EdgeInsets.only(top: 4),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    );
  }
}
