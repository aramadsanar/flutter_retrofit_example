import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  const BaseWidget({
    super.key,
    required this.builder,
    required this.model,
    this.child,
    required this.onModelReady,
  });

  final Widget Function(BuildContext context, T model, Widget? child) builder;
  final T model;
  final Widget? child;
  final Function(T) onModelReady;

  @override
  BaseWidgetState<T> createState() => BaseWidgetState<T>();
}

class BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  late T model;

  @override
  void initState() {
    model = widget.model;
    widget.onModelReady(model);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => model,
      child: Consumer<T>(
        builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}
