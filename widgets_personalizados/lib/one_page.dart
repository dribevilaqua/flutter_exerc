import 'dart:math';
import 'package:flutter/material.dart';
import 'package:widgets_personalizados/widgets/custom_button_widget.dart';

class OnePage extends StatefulWidget {
  const OnePage({super.key});

  @override
  State<OnePage> createState() => _OnePageState();
}
//usando ValueNotifier 
//class _OnePageState extends State<OnePage> {
  //int valorAleatorio = 0;
class _OnePageState extends State<OnePage> {
  ValueNotifier<int> valorAleatorio = ValueNotifier<int>(0);

random() async {
  for (int i = 0; i < 100; i++) {
    await Future.delayed(const Duration(seconds: 1));
    //setState(() { não usa setState no ValueNotifier
      //usando ValueNotifier
      //valorAleatorio = Random().nextInt(100);
      valorAleatorio.value = Random().nextInt(100);
   // });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //usando ValueNotifier
            //Text(
              //'Valor é: $valorAleatorio',
              //style: TextStyle(fontSize: 20),),

            ValueListenableBuilder(
              valueListenable: valorAleatorio, 
              builder:(_, value, __) => Text(
                'Valor é: $value',
                style: TextStyle(fontSize: 20),
              ),
            ),

            SizedBox(height: 10),
            CustomButtonWidget(
              disable: false,
              onPressed: () => random(),
              title: 'Custom BTN',
              titleSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
