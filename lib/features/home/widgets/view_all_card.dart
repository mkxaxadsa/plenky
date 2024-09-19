import 'package:flutter/cupertino.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/router.dart';

class ViewAllCard extends StatelessWidget {
  const ViewAllCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Broken Items',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16,
            fontFamily: Fonts.extra,
          ),
        ),
        const Spacer(),
        CupertinoButton(
          onPressed: () {
            context.push(Routes.brokens);
          },
          padding: EdgeInsets.zero,
          minSize: 31,
          child: Container(
            height: 31,
            width: 84,
            decoration: BoxDecoration(
              color: AppColors.white24,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                'View All',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontFamily: Fonts.extra,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
