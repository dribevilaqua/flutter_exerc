import 'package:flutter/material.dart';
import 'package:navegacao_entre_paginas/two_page.dart';

class OnePage extends StatelessWidget {
  const OnePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/twoPage', arguments: 'teste').then(
              (value) => print(null));      
          },
          //não permite voltar para a página anterior
         // Navigator.of(context).pushReplacementNamed('/twoPage', arguments: 'teste').then(
           //   (value) => print(null));},
          child: Text('Ir para Segunda Page')
          ),
        ),
      );
  } 
}