import 'dart:ui';

import 'package:flutter/material.dart';

import '../config/app_colors.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(color: AppColors.textfield),
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: ExactAssetImage('assets/bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.bg.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: -200,
                  bottom: 100,
                  child: Opacity(
                    opacity: 0.4,
                    child: Container(
                      height: 400,
                      width: 400,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            const Color(0xffB320A7),
                            const Color(0xff590694).withOpacity(0),
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffB320A7),
                            blurRadius: 50,
                            spreadRadius: 20,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: -200,
                  bottom: -200,
                  child: Opacity(
                    opacity: 0.4,
                    child: Container(
                      height: 400,
                      width: 400,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            const Color(0xffB320A7),
                            const Color(0xff590694).withOpacity(0),
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffB320A7),
                            blurRadius: 50,
                            spreadRadius: 20,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: -100,
                  child: Opacity(
                    opacity: 0.4,
                    child: Container(
                      height: 280,
                      width: 280,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            const Color(0xffB320A7),
                            const Color(0xff590694).withOpacity(0),
                          ],
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xffB320A7),
                            blurRadius: 50,
                            spreadRadius: 20,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                body,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
