//baseado no API_LIB
//utilizando o padrão MVC (Model-View-Controller)
//separa as responsabilidades do código em três camadas distintas, em arquivos
//view, model e controller.
//view: tem que montar a page, não tem que saber fazer chamadar http, chamar objetos
//controller: faz a ligação entre view e model, chama o model para pegar os dados, 
//objeto que faz a ponte (regra de negócio)
//model: faz a chamada http, pega os dados da API

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  @override
  String toString() {
    return 'Post{userId: $userId, id: $id, title: $title, body: $body}';
  }
}