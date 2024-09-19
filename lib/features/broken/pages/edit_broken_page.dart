import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/broken.dart';
import '../../../core/utils.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../bloc/broken_bloc.dart';

class EditBrokenPage extends StatefulWidget {
  const EditBrokenPage({super.key, required this.broken});

  final Broken broken;

  @override
  State<EditBrokenPage> createState() => _EditBrokenPageState();
}

class _EditBrokenPageState extends State<EditBrokenPage> {
  void onDone(bool done) {
    context.read<BrokenBloc>().add(
          EditBrokenEvent(
            id: widget.broken.id,
            done: done,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          Column(
            children: [
              CustomAppbar(
                title: 'Broken Item',
                broken: widget.broken,
                settings: true,
              ),
              const SizedBox(height: 12),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    const SizedBox(height: 12),
                    const _Title('Additional Photo'),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            color: AppColors.textfield,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: widget.broken.image.isNotEmpty
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(24),
                                  child: Image.file(
                                    File(widget.broken.image),
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  ),
                                )
                              : null,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const _Title('Description of the problem'),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        widget.broken.description,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 16,
                          fontFamily: Fonts.medium,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const _Title('List of necessary expenses'),
                    const SizedBox(height: 10),
                    ...List.generate(
                      widget.broken.expenses.length,
                      (index) {
                        return Container(
                          height: 50,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: AppColors.card,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  widget.broken.expenses[index].title,
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 16,
                                    fontFamily: Fonts.extra,
                                  ),
                                ),
                              ),
                              Text(
                                '\$${widget.broken.expenses[index].price}',
                                style: const TextStyle(
                                  color: AppColors.main,
                                  fontSize: 16,
                                  fontFamily: Fonts.extra,
                                ),
                              ),
                              const SizedBox(width: 20),
                            ],
                          ),
                        );
                      },
                    ),
                    Container(
                      height: 50,
                      margin: const EdgeInsets.only(bottom: 12),
                      decoration: BoxDecoration(
                        color: AppColors.card,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          const Expanded(
                            child: Text(
                              'All expenses',
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 16,
                                fontFamily: Fonts.extra,
                              ),
                            ),
                          ),
                          Text(
                            getTotalBrokenExpense(widget.broken),
                            style: const TextStyle(
                              color: AppColors.main,
                              fontSize: 16,
                              fontFamily: Fonts.extra,
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ),
                    const SizedBox(height: 150),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 98 + getBottom(context),
              decoration: const BoxDecoration(
                color: AppColors.textfield,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: BlocBuilder<BrokenBloc, BrokenState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          _Button(
                            title: 'Remote',
                            active: !widget.broken.done,
                            value: false,
                            onPressed: onDone,
                          ),
                          const SizedBox(width: 20),
                          _Button(
                            title: 'Done',
                            active: widget.broken.done,
                            value: true,
                            onPressed: onDone,
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppColors.white,
        fontSize: 14,
        fontFamily: Fonts.medium,
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.active,
    required this.value,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final bool value;
  final void Function(bool) onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CupertinoButton(
        onPressed: () {
          onPressed(value);
        },
        padding: EdgeInsets.zero,
        child: Container(
          height: 54,
          decoration: BoxDecoration(
            color: active ? AppColors.main : AppColors.white24,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontFamily: Fonts.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
