import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_trending/screens/list_item.dart';
import 'package:github_trending/service/github_service.dart';
import 'package:github_trending/store/github_store.dart';
import 'package:provider/provider.dart';
import 'package:date_format/date_format.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ScrollController controller;
  final TextEditingController _searchQuery = new TextEditingController();
  bool _searchEmpty=true;
  //Widget _appBarTitle = Text("Github Trending");
 // int _count = 0;
  GitStore git;

  @override
  void initState() {
    super.initState();
    git ??= Provider.of<GitStore>(context, listen: false);
   // git.getRepoList(_count);
   // _count += 25;
    //git.search('python');
    // controller = new ScrollController()..addListener(_scrollListener);
  }
//Widget _appBarTitle=searchTextField();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:searchTextField(),
          centerTitle: true,
          // actions: <Widget>[
          //   IconButton(icon: Icon(Icons.search), onPressed: () {
          //     setState(() {
          //       _appBarTitle = TextField(
          //         controller: _searchQuery, onSubmitted: (value) {
          //         git.search(value);
          //         _appBarTitle = Text('Search: $value');
          //       },);
          //     });
          //   })
          // ],
        ),
        body: listView());
  }

  Widget listView() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: _searchEmpty!=true?Observer(builder: (_) {
        return git.mySearchState == StoreState.loaded
            ?
        // Scrollbar(
        //       child:
        ListView.builder(
            controller: controller,
            itemCount: git.searchList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListItem(git.searchList[index]);
            })
        //  )
            : Center(
          child: CircularProgressIndicator(),
        );
      }):Center(child: Text("Type to search",style: Theme.of(context).textTheme.headline6),),
    );
  }
 Widget searchTextField(){

    return TextField(controller: _searchQuery,onSubmitted: (value){
      git.search(value);
      setState(() {
        _searchEmpty=false;
       // _searchQuery.clear();
        return Text('Search Result: $value');
      });
    },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            prefixIcon: Icon(Icons.search),
            hintText: "Type to search",
            border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
                borderRadius: BorderRadius.circular(25.0)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 32.0),
                borderRadius: BorderRadius.circular(25.0))),);
  }
}