import 'package:flutter/material.dart';
import 'package:widgets_personalizados/widgets/custom_button_widget.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
      child: CustomButtonWidget(
        disable: false,
        onPressed: () {},
        title:'Custom BTN',
        titleSize: 20,
      ),
    ),
    );
  }
} 
