import 'package:flutter/material.dart';

class ChipWidget extends StatelessWidget {
  const ChipWidget({
    Key? key,
    required this.onTap,
    required this.widget,
    required this.horizontalPadding,
  }) : super(key: key);

  final VoidCallback onTap;
  final Widget widget;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: widget,
    );
  }
}
