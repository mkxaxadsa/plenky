import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';

class PeriodBrokensCard extends StatelessWidget {
  const PeriodBrokensCard({
    super.key,
    required this.title,
    required this.active,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final void Function(String) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: active ? AppColors.main : AppColors.textfield,
        borderRadius: BorderRadius.circular(32),
      ),
      child: CupertinoButton(
        onPressed: () {
          onPressed(title);
        },
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontFamily: Fonts.medium,
                ),
              ),
            ),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: active ? AppColors.white : AppColors.main,
                borderRadius: BorderRadius.circular(12),
              ),
              child: active
                  ? Center(
                      child: SvgPicture.asset('assets/check.svg'),
                    )
                  : null,
            ),
            const SizedBox(width: 20),
          ],
        ),
      ),
    );
  }
}
