import 'package:flutter/material.dart';
import 'package:projeto01/Controllers/home_controller.dart';
import 'package:projeto01/models/post.model.dart';
import 'package:projeto01/repositories/home_repository_imp.dart';
import 'package:projeto01/service/prefs_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await PrefsService.logout();
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/login', (_) => false);
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts,
        builder: (_, list, __) {
          return ListView.separated(
            itemCount: list.length,
            itemBuilder: (_, idx) => ListTile(
              leading: Text(list[idx].id.toString()),
              title: Text(list[idx].title),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pushNamed(
                  '/details',
                  arguments: list[idx],
                );
              },
            ),
            separatorBuilder: (_, __) => const Divider(),
          );
        },
      ),
    );
  }
}
