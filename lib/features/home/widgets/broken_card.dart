import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/config/router.dart';
import '../../../core/models/broken.dart';
import '../../../core/utils.dart';

class BrokenCard extends StatelessWidget {
  const BrokenCard({super.key, required this.broken});

  final Broken broken;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.textfield,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            broken.period,
            style: const TextStyle(
              color: AppColors.main,
              fontSize: 14,
              fontFamily: Fonts.medium,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            broken.reason,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontFamily: Fonts.extra,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 4,
            runSpacing: 4,
            children: [
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: AppColors.white24,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      broken.title,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontFamily: Fonts.medium,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  color: AppColors.white24,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      broken.category,
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontFamily: Fonts.medium,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                height: 36,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Text(
                      getTotalBrokenExpense(broken),
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 16,
                        fontFamily: Fonts.extra,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              CupertinoButton(
                onPressed: () {
                  context.push(Routes.edit, extra: broken);
                },
                padding: EdgeInsets.zero,
                minSize: 36,
                child: Container(
                  height: 36,
                  width: 90,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppColors.main10,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      const Text(
                        'Open',
                        style: TextStyle(
                          color: AppColors.main,
                          fontSize: 16,
                          fontFamily: Fonts.extra,
                        ),
                      ),
                      SvgPicture.asset(
                        'assets/arrow_top.svg',
                        color: AppColors.main,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
