import 'package:flutter/material.dart';
import 'package:retrofit_dio_example/core/models/post.dart';

class PostItemWidget extends StatelessWidget {
  const PostItemWidget({
    Key? key,
    required this.item,
    this.onClick,
  }) : super(key: key);

  final Post item;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(
        fontSize: 20,
      ),
    );

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Text(
            item.title ?? '',
          ),
          if (item.title?.isNotEmpty == true) ...<Widget>[
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              style: style,
              onPressed: onClick,
              child: const Text('See Detail'),
            ),
          ],
        ],
      ),
    );
  }
}
