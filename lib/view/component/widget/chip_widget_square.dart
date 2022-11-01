import 'package:flutter/material.dart';

class CustomSquareButton extends StatelessWidget {
  final BuildContext context;
  final IconData icon;
  final VoidCallback onTap;
  const CustomSquareButton(
      {super.key,
      required this.context,
      required this.icon,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      width: 48,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 9),
          backgroundColor: theme.primaryColor.withOpacity(0.2),
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        child: Center(
          child: Icon(
            icon,
            color: theme.primaryColor,
            size: 20,
          ),
        ),
      ),
    );
  }
}
