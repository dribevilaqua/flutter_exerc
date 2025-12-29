import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mvc_pattern/models/posts.model.dart';
import 'package:http/http.dart' as http;

//baseado no API_LIB
//utilizando o padrão MVC (Model-View-Controller)
//separa as responsabilidades do código em três camadas distintas, em arquivos
//view, model e controller.
//view: tem que montar a page, não tem que saber fazer chamadar http, chamar objetos
//controller: faz a ligação entre view e model, chama o model para pegar os dados, 
//objeto que faz a ponte (regra de negócio)
//model: faz a chamada http, pega os dados da API

//criou a classe
class PostsController {
   ValueNotifier<List<Post>> posts = ValueNotifier<List<Post>>([]);
  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  callAPI() async {
    var client = http.Client();
    try {
      inLoader.value = true;

      var response = await client.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      );

      var decodedResponse = jsonDecode(response.body) as List;
      posts.value =
          decodedResponse.map((e) => Post.fromJson(e)).toList();
          await Future.delayed(Duration(seconds: 2));
    } finally {
      client.close();
      inLoader.value = false;
    }
  }

  void random() {
    var random = Random();
    var randomId = random.nextInt(100) + 1;
    print('Random ID: $randomId');

    callAPI();
  }
}