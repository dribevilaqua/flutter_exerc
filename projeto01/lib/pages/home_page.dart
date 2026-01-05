import 'package:flutter/material.dart';
import 'package:projeto01/Controllers/home_controller.dart';
import 'package:projeto01/models/post.model.dart';
import 'package:projeto01/repositories/home_repository_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
}

class _HomepageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    _controller.fetch();
    super.initState();
  }

  @override
    Widget build(BuildContext context) {
        return Scaffold(
              appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        elevation: 0,
          ),    
      body: ValueListenableBuilder<List<PostModel>>(
              valueListenable: _controller.posts,
              builder: (_, list, __) {
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (_, idx) => ListTile(
                    leading: Text(list[idx].id.toString()),
                    title: Text(list[idx].title),
                    trailing: Icon(Icons.arrow_forward),
                  ),
                  separatorBuilder: (_, __) => Divider(),
                );
              },
            )
    );
  }
}
