import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(
            title: 'Settings',
            settings: true,
          ),
          const SizedBox(height: 24),
          _Tile(
            title: 'Share with Friends',
            onTap: () => _shareApp(),
          ),
          const SizedBox(height: 10),
          _Tile(
            title: 'Terms of Service',
            onTap: () => _launchURL(
                'https://docs.google.com/document/d/1jY_63Kt6aqw56dp7h6Dms4tow-g2rahTyYV3SqZNiYw/edit?usp=sharing'),
          ),
          const SizedBox(height: 10),
          _Tile(
            title: 'Privacy Policy',
            onTap: () => _launchURL(
                'https://docs.google.com/document/d/16NBYCrAZjkZD9PMF2fSvJYPj_bXb3nJ4dNfqTk3BNLs/edit?usp=sharing'),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _shareApp() {
    Share.share(
      'Download and repair your items with our app Plenky: FixEase Pro in AppStore!',
      subject: 'Check out Plenky: FixEase Pro!',
    );
  }
}

class _Tile extends StatelessWidget {
  final VoidCallback onTap;
  final String title;

  const _Tile({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: AppColors.main,
        borderRadius: BorderRadius.circular(50),
      ),
      child: CupertinoButton(
        onPressed: onTap,
        padding: EdgeInsets.zero,
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                  fontFamily: Fonts.bold,
                ),
              ),
            ),
            SvgPicture.asset('assets/arrow_top.svg'),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
