import 'package:shared_preferences/shared_preferences.dart';

Future<void> registerPlugins(dynamic registrar) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  // Exemplo de uso
  await prefs.setBool('initialized', true);
}
