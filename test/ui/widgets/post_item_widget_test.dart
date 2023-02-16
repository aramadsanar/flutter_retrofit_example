import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:retrofit_dio_example/core/models/post.dart';
import 'package:retrofit_dio_example/ui/widgets/post_item_widget.dart';

void main() {
  // Test data
  final post = Post(
    userId: 1,
    id: 1,
    title: 'Test Title',
    body: 'Test Body',
  );

  final postNoTitle = Post(
    userId: 1,
    id: 1,
    body: 'Test Body',
  );

  testWidgets(
    'PostItemWidget displays title and a button',
    (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostItemWidget(
              item: post,
              onClick: () {},
            ),
          ),
        ),
      );

      // Check that the title is displayed
      expect(find.text(post.title!), findsOneWidget);

      // Check that the button is displayed
      expect(find.text('See Detail'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    },
  );

  testWidgets(
    'PostItemWidget button does not appear when item param title field is null',
    (WidgetTester tester) async {
      // Build the widget with a null onClick function
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: PostItemWidget(
            item: postNoTitle,
            onClick: null,
          ),
        ),
      ));

      expect(find.byType(ElevatedButton), findsNothing);
    },
  );

  testWidgets(
    'PostItemWidget clicking the see detail button calls the onClick function',
    (WidgetTester tester) async {
      // Build the widget

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostItemWidget(
              item: post,
              onClick: () {},
            ),
          ),
        ),
      );

      // Check that the title is displayed
      expect(find.text(post.title!), findsOneWidget);

      // Check that the button is displayed
      expect(find.text('See Detail'), findsOneWidget);
      expect(find.byType(ElevatedButton), findsOneWidget);
    },
  );

  testWidgets(
    'PostItemWidget displays title and a button - find by Widget keys',
    (WidgetTester tester) async {
      // Build the widget
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: PostItemWidget(
              item: post,
              onClick: () {},
            ),
          ),
        ),
      );

      expect(find.byKey(PostItemWidgetKeys.textSectionKey), findsOneWidget);
      expect(find.byKey(PostItemWidgetKeys.buttonSectionKey), findsOneWidget);
    },
  );
}
