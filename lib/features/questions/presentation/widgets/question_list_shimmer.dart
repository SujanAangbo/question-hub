import 'package:flutter/material.dart';

import '../../../../utils/ui/shimmer_scaffold.dart';
import '../../../../utils/ui/shimmer_skeleton.dart';
import '../../../../utils/ui/sized_box.dart';

class QuestionListShimmer extends StatelessWidget {
  const QuestionListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ShimmerScaffold(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(height: 40),
              8.heightBox,
              Skeleton(height: 30, width: 80),
              8.heightBox,

              Column(
                children: List.generate(16, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeleton(height: 20),
                        4.widthBox,
                        Skeleton(height: 20),
                        4.widthBox,
                        Skeleton(height: 20, width: 200),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
