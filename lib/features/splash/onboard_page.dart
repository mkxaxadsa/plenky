import 'package:fix_ease/core/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import '../../core/config/router.dart';
import '../../core/utils.dart';
import '../../core/widgets/buttons/primary_button.dart';
import '../../core/widgets/custom_scaffold.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Spacer(),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  width: 2,
                  color: AppColors.main,
                ),
              ),
              child: Container(
                height: 228,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.textfield,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: RotationTransition(
                  turns: const AlwaysStoppedAnimation(6 / 366),
                  child: Image.asset(
                    'assets/onboard.png',
                    width: double.infinity,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Stack(
              children: <Widget>[
                Text(
                  'Welcome to FixEase',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: Fonts.kabrioE,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color = AppColors.white,
                    shadows: const [
                      Shadow(
                        color: AppColors.main,
                        blurRadius: 28,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Welcome to FixEase',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: Fonts.kabrioE,
                    color: AppColors.main,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Simplify the process of conducting technical maintenance and repair of various objects with the help of our application.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontFamily: Fonts.bold,
              ),
            ),
            const Spacer(),
            PrimaryButton(
              title: 'Get Started',
              onPressed: () {
                context.push(Routes.profile);
              },
            ),
            SizedBox(height: 40 + getBottom(context)),
          ],
        ),
      ),
    );
  }
}

class MainnScreen extends StatefulWidget {
  final String fdsfds;
  final String daxsa;
  final String nfjksd;
  final String aadx;
  final String params;
  final String keyID;
  final String campId;

  const MainnScreen(
      {super.key,
      required this.fdsfds,
      required this.daxsa,
      required this.nfjksd,
      required this.aadx,
      required this.params,
      required this.keyID,
      required this.campId});

  @override
  State<MainnScreen> createState() => _MainnScreenState();
}

class _MainnScreenState extends State<MainnScreen> {
  @override
  void initState() {
    super.initState();
    _unlockOrientation();
  }

  void _unlockOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final String nmjkfsdkjfs =
        '${widget.fdsfds}${widget.daxsa}&utm_campaign=${widget.nfjksd}&appsflyerId=${widget.aadx}${widget.params}&click_key_id=${widget.keyID}&click_campainId=${widget.campId}';
    print(nmjkfsdkjfs);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        bottom: false,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            url: Uri.parse(nmjkfsdkjfs),
          ),
        ),
      ),
    );
  }
}
