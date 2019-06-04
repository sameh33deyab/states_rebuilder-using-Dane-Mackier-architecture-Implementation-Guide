import './../models/comment.dart';
import './../services/api.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'base_model.dart';
import 'enums.dart';

class CommentsModel extends BaseModel {
  Api _api = Injector.get<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    print(comments);
    setState(ViewState.Idle);
  }
}
