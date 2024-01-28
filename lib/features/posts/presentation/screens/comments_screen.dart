import 'package:flutter/material.dart';

import '../widgets/comment_text_field.dart';
import '../widgets/comments_list.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({
    super.key,
    required this.postId,
  });

  final String postId;

  static const routeName = '/comments';

  // hello world

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text('Comments'),
      ),
      body: Column(
        children: [
          // Comments List
          CommentsList(postId: postId),

          // Comment Text field
          CommentTextField(
            postId: postId,
          ),
        ],
      ),
    );
  }
}
