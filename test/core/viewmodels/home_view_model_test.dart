import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit_dio_example/core/api/post_api.dart';
import 'package:retrofit_dio_example/core/models/post.dart';
import 'package:dio/dio.dart' as dio;
import 'package:retrofit_dio_example/core/viewmodels/home_view_model.dart';

class _MockPostApi extends Mock implements PostApi {}

void main() {
  final _MockPostApi postApi = _MockPostApi();

  final HttpResponse<List<Post>> successFetchPostResponse =
      HttpResponse<List<Post>>(
    <Post>[
      Post(id: 1),
      Post(id: 2),
    ],
    dio.Response<dynamic>(
      statusCode: HttpStatus.ok,
      requestOptions: dio.RequestOptions(path: ''),
    ),
  );

  final HttpResponse<List<Post>?> failFetchPostResponse =
      HttpResponse<List<Post>?>(
    null,
    dio.Response<dynamic>(
      statusCode: HttpStatus.internalServerError,
      requestOptions: dio.RequestOptions(path: ''),
    ),
  );

  late HomeViewModel model;

  group('init model HomeViewModel test', () {
    setUp(() {
      model = HomeViewModel(
        postApi: postApi,
      );
    });

    test('success init HomeViewModel', () async {
      when(postApi.getPosts()).thenAnswer(
        (_) async => successFetchPostResponse,
      );

      await model.initModel();

      expect(model.posts.length, 2);
      expect(model.posts[0].id, 1);
      expect(model.posts[1].id, 2);
    });

    test('fail init HomeViewModel', () async {
      when(postApi.getPosts()).thenAnswer(
        (_) async => failFetchPostResponse,
      );

      await model.initModel();

      expect(model.posts.length, 0);
    });
  });
}
