import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:retrofit_dio_example/core/constants/app_constants.dart';
import 'package:retrofit_dio_example/provider_setup.dart';
import 'package:retrofit_dio_example/ui/router.dart' as router;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutePaths.home,
        onGenerateRoute: router.Router.generateRoute,
      ),
    );
  }
}
