import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/app_colors.dart';

class TxtField2 extends StatefulWidget {
  const TxtField2({
    super.key,
    required this.controller,
    required this.hintText,
    this.multiline = false,
    this.number = false,
    this.length = 20,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final bool multiline;
  final bool number;
  final int length;
  final void Function() onChanged;

  @override
  State<TxtField2> createState() => _TxtField2State();
}

class _TxtField2State extends State<TxtField2> {
  double _height() {
    if (widget.multiline) return 140;
    return 48;
  }

  int? _maxLines() {
    if (widget.multiline) return null;
    return 1;
  }

  TextInputType? _keyboardType() {
    if (widget.multiline) return TextInputType.multiline;
    if (widget.number) return TextInputType.number;
    return null;
  }

  List<TextInputFormatter>? _inputFormatters() {
    final length = LengthLimitingTextInputFormatter(widget.length);
    final digit = FilteringTextInputFormatter.digitsOnly;
    if (widget.number) return [length, digit];
    return [length];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height(),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.14),
        borderRadius: BorderRadius.circular(widget.multiline ? 14 : 50),
      ),
      child: TextField(
        controller: widget.controller,
        keyboardType: _keyboardType(),
        maxLines: _maxLines(),
        inputFormatters: _inputFormatters(),
        textCapitalization: TextCapitalization.sentences,
        style: const TextStyle(
          color: AppColors.white,
          fontSize: 14,
          fontFamily: Fonts.bold,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            vertical: widget.multiline ? 16 : 0,
            horizontal: 16,
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: AppColors.white50,
            fontSize: 14,
            fontFamily: Fonts.bold,
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        onChanged: (value) {
          widget.onChanged();
        },
      ),
    );
  }
}
