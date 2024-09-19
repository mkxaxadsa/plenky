import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../features/broken/bloc/broken_bloc.dart';
import '../config/app_colors.dart';
import '../config/router.dart';
import '../models/broken.dart';
import '../utils.dart';
import 'dialogs/delete_dialog.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.home = false,
    this.settings = false,
    this.broken,
  });

  final String title;
  final bool home;
  final bool settings;
  final Broken? broken;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24 + getStatusBar(context)),
      child: Row(
        children: [
          const SizedBox(width: 20),
          if (!home) ...[
            Container(
              height: 42,
              width: 100,
              decoration: BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.circular(30),
              ),
              child: CupertinoButton(
                onPressed: () {
                  context.pop();
                },
                padding: EdgeInsets.zero,
                minSize: 42,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/arrow_back.svg'),
                    const SizedBox(width: 10),
                    const Text(
                      'Back',
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 20,
                        fontFamily: Fonts.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
          ],
          Expanded(
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontFamily: Fonts.kabrioE,
              ),
            ),
          ),
          if (broken != null) ...[
            CupertinoButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return DeleteDialog(
                      title: 'Delete Item?',
                      onYes: () {
                        context
                            .read<BrokenBloc>()
                            .add(DeleteBrokenEvent(id: broken!.id));
                        context.pop();
                      },
                    );
                  },
                );
              },
              padding: EdgeInsets.zero,
              minSize: 42,
              child: Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  color: AppColors.main,
                  borderRadius: BorderRadius.circular(21),
                ),
                child: const Center(
                  child: Icon(
                    Icons.delete,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ] else ...[
            if (!settings)
              CupertinoButton(
                onPressed: () {
                  context.push(Routes.settings);
                },
                padding: EdgeInsets.zero,
                minSize: 42,
                child: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Center(
                    child: SvgPicture.asset('assets/settings.svg'),
                  ),
                ),
              ),
          ],
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
