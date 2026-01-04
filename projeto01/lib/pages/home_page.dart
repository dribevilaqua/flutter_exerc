import 'package:flutter/material.dart';
import 'package:projeto01/Controllers/home_controller.dart';
import 'package:projeto01/models/post.model.dart';
import 'package:projeto01/repositories/home_repository_mock.dart';

class HomePage extends StatefulWidget {
  const HomePage ({super.key});

  @override
  State<HomePage> createState() => _HomepageState();
  }

  class _HomepageState extends State<HomePage> {

    final HomeController _controller = HomeController(HomeRepositoryMock());

  @override
  void initState() {
    // TODO: implement initState
    _controller.fetch();
    super.initState();
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<List<PostModel>>(
        valueListenable: _controller.posts, builder: (_, list, __) {
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (_, idx) => ListTile(title: Text(list[idx].title),));
   }),
    );
  }
}