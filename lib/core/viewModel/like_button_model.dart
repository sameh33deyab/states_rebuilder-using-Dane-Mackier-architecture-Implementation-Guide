import 'package:states_rebuilder/states_rebuilder.dart';

import '../services/posts_service.dart';

import 'base_model.dart';

class LikeButtonModel extends BaseModel {
  PostsService _postsService = Injector.get<PostsService>();

  int postLikes(int postId) {
    return _postsService.posts.firstWhere((post) => post.id == postId).likes;
  }

  void increaseLikes(int postId) {
    _postsService.incrementLikes(postId);
    rebuildStates();
  }
}
