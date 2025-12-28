import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? titleSize;
  final bool disable;

  const CustomButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.disable = false,
    this.titleSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disable ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.resolveWith<Color>(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return Colors.red;
            }
            if (states.contains(WidgetState.pressed)) {
              return Colors.blue;
            }
            return Colors.green;
          },
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        textStyle: WidgetStateProperty.resolveWith<TextStyle>(
          (states) {
            if (states.contains(WidgetState.pressed)) {
              return TextStyle(
                fontSize: titleSize != null ? titleSize! * 1.2 : 28,
              );
            }
            return TextStyle(
              fontSize: titleSize ?? 16,
            );
          },
        ),
      ),
      child: Text(title),
    );
  }
}
