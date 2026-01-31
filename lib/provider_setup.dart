import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:retrofit_dio_example/core/api/post_api.dart';

List<SingleChildWidget> providers = <SingleChildWidget>[
  ...apiServices,
];

List<SingleChildWidget> apiServices = <SingleChildWidget>[
  Provider<PostApi>.value(
    value: PostApi(
      Dio(
        BaseOptions(
          contentType: 'application/json',
          baseUrl: 'https://jsonplaceholder.typicode.com',
        ),
      ),
    ),
  ),
];
