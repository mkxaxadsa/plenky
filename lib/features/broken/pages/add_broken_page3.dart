import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils.dart';
import '../../../core/models/broken.dart';
import '../../../core/config/app_colors.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../bloc/broken_bloc.dart';
import '../widgets/additional_info_card.dart';

class AddBrokenPage3 extends StatefulWidget {
  const AddBrokenPage3({super.key, required this.broken});

  final Broken broken;

  @override
  State<AddBrokenPage3> createState() => _AddBrokenPage3State();
}

class _AddBrokenPage3State extends State<AddBrokenPage3> {
  final controller = TextEditingController();

  ImagePicker picker = ImagePicker();
  XFile image = XFile('');

  void onPickImage() async {
    image = await pickImage();
    if (image.path.isNotEmpty) {
      setState(() {});
    }
  }

  bool active = false;

  void cheackActive() {
    setState(() {
      active = getButtonActive([controller]);
    });
  }

  void onDone() {
    context.read<BrokenBloc>().add(
          AddBrokenEvent(
            broken: Broken(
              id: widget.broken.id,
              title: widget.broken.title,
              category: widget.broken.category,
              reason: widget.broken.reason,
              period: widget.broken.period,
              expenses: widget.broken.expenses,
              image: image.path,
              description: controller.text,
              done: false,
            ),
          ),
        );
    context.pop();
    context.pop();
    context.pop();
  }

  @override
  void dispose() {
    controller.dispose();
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
                    AdditionalInfoCard(
                      controller: controller,
                      imagePath: image.path,
                      onImage: onPickImage,
                      onChanged: cheackActive,
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
                      title: 'Done',
                      active: active,
                      onPressed: onDone,
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
