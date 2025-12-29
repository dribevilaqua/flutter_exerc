import 'package:flutter/material.dart';
import 'package:mvc_pattern/views/one_page.dart';

//baseado no API_LIB
//utilizando o padrão MVC (Model-View-Controller)
//separa as responsabilidades do código em três camadas distintas, em arquivos
//view, model e controller.
//view: tem que montar a page, não tem que saber fazer chamadar http, chamar objetos
//controller: faz a ligação entre view e model, chama o model para pegar os dados, 
//objeto que faz a ponte (regra de negócio)
//model: faz a chamada http, pega os dados da API

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnePage(),
    );
  }
}