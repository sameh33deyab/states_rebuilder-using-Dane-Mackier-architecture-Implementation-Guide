import 'package:states_rebuilder_using_dane_mackier_implementation_guide/core/models/post.dart';

import './../../core/services/authentication_service%20.dart';
import './../../ui/shared/app_colors.dart';
import './../../ui/shared/text_styles.dart';
import './../../ui/shared/ui_helpers.dart';
import './../../ui/widgets/comments.dart';
import './../../ui/widgets/like_button.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class PostView extends StatelessWidget {
  final Post post;
  PostView({this.post});
  final user = Injector.get<AuthenticationService>().userSnapshot.data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Text(post.title, style: headerStyle),
            Text(
              'by ${user.name}',
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(post.body),
            LikeButton(
              postId: post.id,
            ),
            Comments(post.id)
          ],
        ),
      ),
    );
  }
}
