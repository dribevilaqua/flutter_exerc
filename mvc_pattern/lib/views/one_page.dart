import 'package:flutter/material.dart';
import 'package:mvc_pattern/controllers/posts_controller.dart';
import 'package:mvc_pattern/widgets/custom_buttom_widget.dart';

//baseado no API_LIB
//utilizando o padrão MVC (Model-View-Controller)
//separa as responsabilidades do código em três camadas distintas, em arquivos
//view, model e controller.
//view: tem que montar a page, não tem que saber fazer chamadar http, chamar objetos
//controller: faz a ligação entre view e model, chama o model para pegar os dados, 
//objeto que faz a ponte (regra de negócio)
//model: faz a chamada http, pega os dados da API

class OnePage extends StatefulWidget {
  const OnePage({super.key});

  @override
  State<OnePage> createState() => _OnePageState();
}

class _OnePageState extends State<OnePage> {
 
 //para ter acesso ao controller
 final PostsController _controller = PostsController();
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                //onde quebrou chama _controller.
                animation: Listenable.merge([_controller.posts, _controller.inLoader]),
                builder: (_, __) {
                  if (_controller.inLoader.value) {
                    return const CircularProgressIndicator();
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controller.posts.value.length,
                    itemBuilder: (_, idx) => ListTile(
                      title: Text(_controller.posts.value[idx].title),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              CustomButtonWidget(
                disable: false,
                onPressed: _controller.callAPI,
                title: 'Custom BTN',
                titleSize: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


