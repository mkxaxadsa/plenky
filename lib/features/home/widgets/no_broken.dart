import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';

class NoBroken extends StatelessWidget {
  const NoBroken({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 12,
        left: 20,
        right: 20,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'No broken items yet',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 18,
                    fontFamily: Fonts.extra,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Add a new broken item to start the repair.',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontFamily: Fonts.medium,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/gear.png',
            height: 106,
          ),
        ],
      ),
    );
  }
}
