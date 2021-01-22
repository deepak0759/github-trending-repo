import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_trending/screens/home.dart';
import 'package:github_trending/service/github_service.dart';
import 'package:github_trending/store/github_store.dart';
import 'package:github_trending/utils/app_constants.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        Provider(
            create: (_) => ChopperClient(
                baseUrl: BASE_URL,
                services: [GitHubService.create()],
                converter: JsonConverter())),
        ProxyProvider<ChopperClient, GitStore>(
          create: (ctx) => GitStore(null),
          update: (ctx, chopperClient, store) =>
              GitStore(chopperClient.getService<GitHubService>()),
        )
      ],
      child: Consumer<ChopperClient>(
        builder: (ctx, auth, expense) => MyApp(),
      )));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GitHub Trending',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.lightGreen[600],
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline1: TextStyle(
                fontSize: 17.0,
                color: Colors.brown,
                fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 16.0, color: Colors.brown[400]),
            bodyText2: TextStyle(fontSize: 14.0, color: Colors.brown),
          )),
      home: Home(),
    );
  }
}
