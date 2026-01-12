import 'package:flutter/material.dart';

import '../../../../utils/ui/app_horizontal_divider.dart';
import '../../../../utils/ui/shimmer_scaffold.dart';
import '../../../../utils/ui/shimmer_skeleton.dart';
import '../../../../utils/ui/sized_box.dart';

class SubjectListShimmer extends StatelessWidget {
  const SubjectListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerScaffold(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: List.generate(20, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: SizedBox(
                  height: 80,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppHorizontalDivider(),
                      Skeleton(height: 80, width: 80),
                      8.widthBox,
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Skeleton(height: 40),
                            4.heightBox,
                            Skeleton(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
