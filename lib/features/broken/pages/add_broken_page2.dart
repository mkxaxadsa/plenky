import 'package:flutter/material.dart';

import '../../../core/config/router.dart';
import '../../../core/utils.dart';
import '../../../core/models/broken.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/expense_card.dart';

class AddBrokenPage2 extends StatefulWidget {
  const AddBrokenPage2({super.key, required this.broken});

  final Broken broken;

  @override
  State<AddBrokenPage2> createState() => _AddBrokenPage2State();
}

class _AddBrokenPage2State extends State<AddBrokenPage2> {
  List<TextEditingController> controllers1 = [TextEditingController()];
  List<TextEditingController> controllers2 = [TextEditingController()];

  bool active = false;

  void cheackActive() {
    setState(() {
      active = getButtonActive([
        ...controllers1,
        ...controllers2,
      ]);
    });
  }

  void onAdd() {
    controllers1.add(TextEditingController());
    controllers2.add(TextEditingController());
    cheackActive();
  }

  void onRemove() {
    controllers1.removeLast();
    controllers2.removeLast();
    cheackActive();
  }

  void onNext() {
    context.push(
      Routes.add3,
      extra: Broken(
        id: widget.broken.id,
        title: widget.broken.title,
        category: widget.broken.category,
        reason: widget.broken.reason,
        period: widget.broken.period,
        expenses: [
          ...List.generate(
            controllers1.length,
            (index) {
              return Expense(
                title: controllers1[index].text,
                price: int.tryParse(controllers2[index].text) ?? 0,
              );
            },
          )
        ],
        image: '',
        description: '',
        done: false,
      ),
    );
  }

  @override
  void dispose() {
    for (TextEditingController controller in controllers1) {
      controller.dispose();
    }
    for (TextEditingController controller in controllers2) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(title: 'New Broken Item'),
          const SizedBox(height: 12),
          Expanded(
            child: Stack(
              children: [
                ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      'Expenses ${widget.broken.period}',
                      style: const TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontFamily: Fonts.medium,
                      ),
                    ),
                    const SizedBox(height: 12),
                    ...List.generate(
                      controllers1.length,
                      (index) {
                        return ExpenseCard(
                          index: index + 1,
                          controller1: controllers1[index],
                          controller2: controllers2[index],
                          onChanged: cheackActive,
                        );
                      },
                    ),
                    if (controllers1.length >= 2) ...[
                      PrimaryButton(
                        title: '- Remove',
                        onPressed: onRemove,
                      ),
                      const SizedBox(height: 24)
                    ],
                    PrimaryButton(
                      title: '+ Add New',
                      onPressed: onAdd,
                    ),
                    SizedBox(height: 120 + getBottom(context)),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 40 + getBottom(context),
                      left: 20,
                      right: 20,
                    ),
                    child: PrimaryButton(
                      title: 'Next',
                      active: active,
                      onPressed: onNext,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
