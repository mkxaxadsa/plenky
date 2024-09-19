import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/textfields/txt_field2.dart';

class AdditionalInfoCard extends StatelessWidget {
  const AdditionalInfoCard({
    super.key,
    required this.controller,
    required this.imagePath,
    required this.onImage,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String imagePath;
  final void Function() onImage;
  final void Function() onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.textfield,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add Photos',
            style: TextStyle(
              color: AppColors.main,
              fontSize: 14,
              fontFamily: Fonts.medium,
            ),
          ),
          const SizedBox(height: 12),
          CupertinoButton(
            onPressed: onImage,
            padding: EdgeInsets.zero,
            child: Container(
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                color: AppColors.main24,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                child: imagePath.isEmpty
                    ? SvgPicture.asset('assets/img.svg')
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.file(
                          File(imagePath),
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                      ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Description',
            style: TextStyle(
              color: AppColors.main,
              fontSize: 14,
              fontFamily: Fonts.medium,
            ),
          ),
          const SizedBox(height: 8),
          TxtField2(
            controller: controller,
            hintText: 'Additional information about the repair',
            multiline: true,
            onChanged: onChanged,
          )
        ],
      ),
    );
  }
}
