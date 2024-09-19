import 'package:flutter/material.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/textfields/txt_field2.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    super.key,
    required this.index,
    required this.controller1,
    required this.controller2,
    required this.onChanged,
  });

  final int index;
  final TextEditingController controller1;
  final TextEditingController controller2;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: AppColors.textfield,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Expense $index',
            style: const TextStyle(
              color: AppColors.main,
              fontSize: 14,
              fontFamily: Fonts.medium,
            ),
          ),
          const SizedBox(height: 12),
          TxtField2(
            controller: controller1,
            hintText: 'Expense name',
            onChanged: onChanged,
          ),
          const SizedBox(height: 14),
          TxtField2(
            controller: controller2,
            number: true,
            hintText: 'Price',
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
