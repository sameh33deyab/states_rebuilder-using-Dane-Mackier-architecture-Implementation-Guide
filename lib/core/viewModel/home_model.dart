import 'package:states_rebuilder_using_dane_mackier_implementation_guide/core/models/post.dart';

import './../services/posts_service.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'base_model.dart';
import 'enums.dart';

class HomeModel extends BaseModel {
  PostsService _postsService = Injector.get<PostsService>();

  List<Post> get posts => _postsService.posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    await _postsService.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
