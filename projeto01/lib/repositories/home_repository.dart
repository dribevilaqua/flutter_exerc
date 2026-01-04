import 'package:projeto01/models/post.model.dart';

abstract class HomeRepository {
  
  Future<List<PostModel>> getList();

}
