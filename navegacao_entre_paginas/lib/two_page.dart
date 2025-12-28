import 'package:flutter/material.dart';

class TwoPage extends StatelessWidget {
const TwoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
      title: const Text('Two Page'),
        backgroundColor: Colors.blue.shade100,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //voltar pelo botão
            //Navigator.of(context).pop('Retorno');
            //voltar pela seta
            Navigator.of(context).pushNamed('/twoPage', arguments: 'teste').then(
              (value) => print(value));
            //para não fazer o pop (não voltar para página anterior)
            //if(Navigator.of(context).canPop()){
            // Navigator.of(context).pop('Retorno');}
          },
          child: Text('Voltar para page anterior $args'),
        ),
      ),
    );
  }
}