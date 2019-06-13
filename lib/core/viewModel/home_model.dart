import 'package:flutter/widgets.dart';
import 'package:states_rebuilder_using_dane_mackier_implementation_guide/core/models/post.dart';
import 'package:states_rebuilder_using_dane_mackier_implementation_guide/core/models/user.dart';
import 'package:states_rebuilder_using_dane_mackier_implementation_guide/core/services/authentication_service%20.dart';

import './../services/posts_service.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'base_model.dart';
import 'enums.dart';

class HomeModel extends BaseModel {
  PostsService _postsService = Injector.get<PostsService>();

  List<Post> get posts => _postsService.posts;

  AsyncSnapshot<User> userSnapshot =
      Injector.get<AuthenticationService>().userSnapshot;

  getPosts() async {
    setState(ViewState.Busy);
    print(state);

    await _postsService.getPostsForUser(userSnapshot.data.id);
    print("getposts after await");

    setState(ViewState.Idle);
  }
}
