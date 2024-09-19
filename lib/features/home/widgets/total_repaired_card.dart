import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';

class TotalRepairedCard extends StatelessWidget {
  const TotalRepairedCard({super.key, required this.repaired});

  final int repaired;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 36,
                  width: 86,
                  decoration: BoxDecoration(
                    color: AppColors.white44,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      SvgPicture.asset('assets/repaired.svg'),
                      const Spacer(),
                      Text(
                        repaired.toString(),
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 18,
                          fontFamily: Fonts.extra,
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
                const Spacer(),
                const Text(
                  'Total repaired items',
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontFamily: Fonts.medium,
                  ),
                ),
              ],
            ),
          ),
          Image.asset('assets/repaired.png'),
        ],
      ),
    );
  }
}
