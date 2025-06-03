import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_strings.dart';

class MoreLikeThisText extends StatelessWidget {
  const MoreLikeThisText({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
      sliver: SliverToBoxAdapter(
        child: FadeInUp(
          from: 20,
          duration: const Duration(milliseconds: 500),
          child: const Text(
            AppStrings.moreLikeThis,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ),
    );
  }
}
