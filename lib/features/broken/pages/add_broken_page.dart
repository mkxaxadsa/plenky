import 'package:flutter/material.dart';

import '../../../core/config/router.dart';
import '../../../core/models/broken.dart';
import '../../../core/utils.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../../../core/widgets/textfields/txt_field.dart';
import '../widgets/period_brokens_card.dart';

class AddBrokenPage extends StatefulWidget {
  const AddBrokenPage({super.key});

  @override
  State<AddBrokenPage> createState() => _AddBrokenPageState();
}

class _AddBrokenPageState extends State<AddBrokenPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  final controller3 = TextEditingController();
  final controller4 = TextEditingController();

  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
        controller3,
        controller4,
      ]);
    });
  }

  void onPeriod(String value) {
    controller4.text = value;
    checkActive();
  }

  void onNext() {
    context.push(
      Routes.add2,
      extra: Broken(
        id: getCurrentTimestamp(),
        title: controller1.text,
        category: controller2.text,
        reason: controller3.text,
        period: controller4.text,
        expenses: [],
        image: '',
        description: '',
        done: false,
      ),
    );
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
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
                    TxtField(
                      controller: controller1,
                      hintText: 'The name of the item',
                      onChanged: checkActive,
                    ),
                    const SizedBox(height: 10),
                    TxtField(
                      controller: controller2,
                      hintText: 'What category is the item',
                      onChanged: checkActive,
                    ),
                    const SizedBox(height: 10),
                    TxtField(
                      controller: controller3,
                      hintText: 'What the reason for the breakdown',
                      onChanged: checkActive,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Do you often have something\nbroken at home?',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 14,
                        fontFamily: Fonts.medium,
                      ),
                    ),
                    const SizedBox(height: 12),
                    PeriodBrokensCard(
                      title: 'No deadlines',
                      active: controller4.text == 'No deadlines',
                      onPressed: onPeriod,
                    ),
                    const SizedBox(height: 14),
                    PeriodBrokensCard(
                      title: 'Within a month',
                      active: controller4.text == 'Within a month',
                      onPressed: onPeriod,
                    ),
                    const SizedBox(height: 14),
                    PeriodBrokensCard(
                      title: 'During the week',
                      active: controller4.text == 'During the week',
                      onPressed: onPeriod,
                    ),
                    const SizedBox(height: 14),
                    PeriodBrokensCard(
                      title: 'A couple of days',
                      active: controller4.text == 'A couple of days',
                      onPressed: onPeriod,
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
