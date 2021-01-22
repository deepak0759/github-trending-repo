import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_trending/screens/list_item.dart';
import 'package:github_trending/screens/search_screen.dart';
import 'package:github_trending/service/github_service.dart';
import 'package:github_trending/store/github_store.dart';
import 'package:github_trending/utils/app_constants.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController controller;
  Widget _appBarTitle = Text(TITLE);
  GitStore git;
  String _selectedItem = 'weekly';
  int _days = 7;
  @override
  void initState() {
    super.initState();
    git ??= Provider.of<GitStore>(context, listen: false);
    git.getRepoList(_days);
    //  _count+=25;
    //git.search('python');
    // controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: _appBarTitle,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ));
                }),
          ],
        ),
        body: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.lightGreen[200],
                  border: Border.all(width: 2, color: Colors.lightGreen),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(SELECT_DAYS,
                      style: TextStyle(
                        fontFamily: "Spartan",
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        decoration: TextDecoration.none,
                        color: Colors.brown,
                      )),
                  DropdownButton(
                    value: _selectedItem,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 20,
                    elevation: 16,
                    style: TextStyle(color: Colors.black54),
                    underline: Container(
                      height: 2,
                      color: Colors.black54,
                    ),
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem(
                        child: new Text('Today'),
                        value: 'today',
                      ),
                      DropdownMenuItem(
                          child: new Text('Weekly'), value: 'weekly'),
                      DropdownMenuItem(
                          child: new Text('Monthly'), value: 'monthly')
                    ],
                    onChanged: (value) {
                      setState(() {
                        _selectedItem = value;
                        switch (value) {
                          case 'today':
                            {
                              _days = 1;
                              break;
                            }
                          case 'weekly':
                            {
                              _days = 7;
                              break;
                            }
                          case 'monthly':
                            {
                              _days = 30;
                              break;
                            }
                        }
                        git.getRepoList(_days);
                      });
                    },
                  ),
                ],
              ),
            ),
            listView(),
          ],
        ));
  }

  Widget listView() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      child: Observer(builder: (_) {
        return git.mystate == StoreState.loaded
            ? ListView.builder(
                controller: controller,
                itemCount: git.repoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListItem(git.repoList[index]);
                })
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
