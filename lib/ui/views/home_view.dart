import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_using_dane_mackier_implementation_guide/core/models/post.dart';
import './../../core/viewModel/home_model.dart';
import './../../ui/shared/app_colors.dart';
import './../../ui/shared/text_styles.dart';
import './../../ui/shared/ui_helpers.dart';
import './../../ui/widgets/postlist_item.dart';
import '../../core/viewModel/enums.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Injector<HomeModel>(
      models: [() => HomeModel()],
      initState: (model) => model.getPosts(),
      builder: (context, model) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: model.state == ViewState.Idle
              ? Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  UIHelper.verticalSpaceLarge(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Welcome ${model.userSnapshot.data.name}',
                      style: headerStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:
                        Text('Here are all your posts', style: subHeaderStyle),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Expanded(child: getPostsUi(model.posts)),
                ])
              : Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) => PostListItem(
              post: posts[index],
              onTap: () {
                Navigator.pushNamed(context, 'post', arguments: posts[index]);
              },
            ),
      );
}
