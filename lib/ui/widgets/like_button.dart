import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import '../../core/viewModel/like_button_model.dart';

class LikeButton extends StatelessWidget {
  final int postId;

  LikeButton({
    @required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return Injector(
      models: [() => LikeButtonModel()],
      builder: (_) {
        final model = Injector.get<LikeButtonModel>();
        return StateBuilder(
            blocs: [model],
            builder: (_, __) => Row(
                  children: <Widget>[
                    Text('Likes ${model.postLikes(postId)}'),
                    MaterialButton(
                      color: Colors.white,
                      child: Icon(Icons.thumb_up),
                      onPressed: () {
                        model.increaseLikes(postId);
                      },
                    )
                  ],
                ));
      },
    );
  }
}
