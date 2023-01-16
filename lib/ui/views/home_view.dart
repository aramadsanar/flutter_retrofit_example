import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofit_dio_example/core/api/post_api.dart';
import 'package:retrofit_dio_example/core/models/post.dart';
import 'package:retrofit_dio_example/core/viewmodels/home_view_model.dart';
import 'package:retrofit_dio_example/ui/views/base_widget.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeViewModel>(
      model: HomeViewModel(
        postApi: Provider.of<PostApi>(context),
      ),
      onModelReady: (HomeViewModel model) => model.initModel(),
      builder: (BuildContext context, HomeViewModel model, _) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Flutter Retrofit Example',
            ),
          ),
          body: _buildBody(context, model),
        );
      },
    );
  }

  Widget _buildBody(
    BuildContext context,
    HomeViewModel model,
  ) {
    if (model.busy) {
      Center(
        child: CircularProgressIndicator(),
      );
    }

    return _buildPosts(context, model);
  }

  Widget _buildPosts(
    BuildContext context,
    HomeViewModel model,
  ) {
    return ListView.builder(
      itemCount: model.posts.length,
      itemBuilder: (context, index) {
        final Post item = model.posts[index];
        return Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            item.title ?? '',
          ),
        );
      },
    );
  }
}
