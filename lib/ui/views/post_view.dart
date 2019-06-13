import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_using_dane_mackier_implementation_guide/core/models/post.dart';
import 'package:states_rebuilder_using_dane_mackier_implementation_guide/core/viewModel/post_model.dart';

import './../../ui/shared/app_colors.dart';
import './../../ui/shared/text_styles.dart';
import './../../ui/shared/ui_helpers.dart';
import './../../ui/widgets/comments.dart';
import './../../ui/widgets/like_button.dart';
import 'package:flutter/material.dart';

class PostView extends StatelessWidget {
  final Post post;
  PostView({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Injector<PostModel>(
        models: [() => PostModel()],
        builder: (context, model) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  UIHelper.verticalSpaceLarge(),
                  Text(post.title, style: headerStyle),
                  Text(
                    'by ${model.user.name}',
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
      ),
    );
  }
}
