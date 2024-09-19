import 'package:flutter/material.dart';

import '../../core/config/router.dart';
import '../../core/db/prefs.dart';
import '../../core/utils.dart';
import '../../core/config/app_colors.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom_appbar.dart';
import '../../core/widgets/custom_scaffold.dart';
import '../../core/widgets/textfields/txt_field.dart';
import '../broken/widgets/period_brokens_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  bool active = false;

  void checkActive() {
    setState(() {
      active = getButtonActive([
        controller1,
        controller2,
      ]);
    });
  }

  void onPeriod(String value) {
    controller2.text = value;
    checkActive();
  }

  void onNext() async {
    await saveOnboard().then((_) {
      if (mounted) context.go(Routes.home);
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(
            title: '',
            settings: true,
          ),
          const SizedBox(height: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Let’s get acquainted',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 30,
                      fontFamily: Fonts.kabrioE,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TxtField(
                    controller: controller1,
                    hintText: 'Your Name',
                    onChanged: checkActive,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Do you often have something\nbroken at home?',
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                      fontFamily: Fonts.medium,
                    ),
                  ),
                  const SizedBox(height: 10),
                  PeriodBrokensCard(
                    title: 'Rarely',
                    active: controller2.text == 'Rarely',
                    onPressed: onPeriod,
                  ),
                  const SizedBox(height: 14),
                  PeriodBrokensCard(
                    title: 'Periodicaly',
                    active: controller2.text == 'Periodicaly',
                    onPressed: onPeriod,
                  ),
                  const SizedBox(height: 14),
                  PeriodBrokensCard(
                    title: 'Often',
                    active: controller2.text == 'Often',
                    onPressed: onPeriod,
                  ),
                  const Spacer(),
                  PrimaryButton(
                    title: 'Next',
                    active: active,
                    onPressed: onNext,
                  ),
                  SizedBox(height: 40 + getBottom(context)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
