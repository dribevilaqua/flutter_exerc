import 'package:flutter/material.dart';

//baseado no API_LIB
//utilizando o padrão MVC (Model-View-Controller)
//separa as responsabilidades do código em três camadas distintas, em arquivos
//view, model e controller.
//view: tem que montar a page, não tem que saber fazer chamadar http, chamar objetos
//controller: faz a ligação entre view e model, chama o model para pegar os dados, 
//objeto que faz a ponte (regra de negócio)
//model: faz a chamada http, pega os dados da API

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
