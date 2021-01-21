import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_trending/screens/home.dart';
//import 'package:github_trending/screens/home.dart';
import 'package:github_trending/service/github_service.dart';
import 'package:github_trending/store/github_store.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        Provider(
            create: (_) => ChopperClient(
                baseUrl: 'https://api.github.com',
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
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.lightGreen[600],
        visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline1: TextStyle(fontSize: 18.0, color: Colors.brown,fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 16.0, color: Colors.brown[400]),
            bodyText2: TextStyle(fontSize: 14.0, color: Colors.brown),
          )
      ),
      home: Home(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GitStore git;

  // @override
  // void initState() {
  //   git ??= Provider.of<GitStore>(context, listen: false);
  //   git.getRepoList();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('widget.title'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'List',
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.8,
              width: MediaQuery.of(context).size.width,
              child: Observer(builder: (_) {
                return git.mystate == StoreState.loaded
                    ? ListView.builder(
                        itemCount: git.repoList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                          //   onTap: (){ Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => SecondPage(git.repoList[index])),
                          // );},
                            title: Text(git.repoList[index].name),
                            subtitle: Text(
                                git.repoList[index].watchers_count.toString()),
 //                           leading: git.repoList[index].owner.avatar_url==null ? Image.asset(name):Image.network(src),
                          );
                        })
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              }),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
