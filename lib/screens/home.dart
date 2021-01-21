import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:github_trending/screens/list_item.dart';
import 'package:github_trending/screens/search_screen.dart';
import 'package:github_trending/service/github_service.dart';
import 'package:github_trending/store/github_store.dart';
import 'package:provider/provider.dart';
import 'package:date_format/date_format.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController controller;
  final TextEditingController _searchQuery = new TextEditingController();
  Widget _appBarTitle=Text("Github Trending");
  int _count=0;
  GitStore git;
  String _selectedItem='weekly';
 // Map _dropdownMenuItems ={'Today':'Today','Weekly':'Weekly','Monthly':'Monthly'};
  var _isSelected = [false, true, false];
  int _days=7;
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
            Row(
              children: [
                IconButton(icon: Icon(Icons.search), onPressed:() {
                  // setState(() {
                  //   _appBarTitle= TextField(controller: _searchQuery,onSubmitted: (value){
                  //     git.search(value);
                  //     _appBarTitle=Text('Search: $value');
                  //   },)  ;
                  // });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchScreen(),
                      ));
                }),
              ],
            )
          ],

        ),
        body: Column(
          children: [
          //   ToggleButtons(children: [Padding(
          //   padding: EdgeInsets.only(left: 20, right: 20),
          //   child: Text('Today',
          //       style: TextStyle(
          //           color: Colors.orange,
          //           fontSize: 16,
          //           fontWeight: FontWeight.bold)),
          // ),
          //   Padding(
          //     padding: EdgeInsets.only(left: 20, right: 20),
          //     child: Text('Weekly',
          //         style: TextStyle(
          //             color: Colors.orange,
          //             fontSize: 16,
          //             fontWeight: FontWeight.bold)),
          //   ),
          //   Padding(
          //       padding: EdgeInsets.only(left: 20, right: 20),
          //       child: Text('Monthly',
          //           style: TextStyle(
          //               color: Colors.orange,
          //               fontSize: 16,
          //               fontWeight: FontWeight.bold))),], isSelected:_isSelected ,fillColor: Colors.teal,
          //     borderRadius: BorderRadius.circular(10),
          //     borderWidth: 2,
          //     borderColor: Colors.amberAccent,onPressed: (index){
          //   setState(() {
          //     switch(index) {
          //       case 0: {
          //         _isSelected=[true,false,false];
          //          _days=1;
          //
          //       }
          //       break;
          //
          //       case 1: {
          //         _isSelected=[false,true,false];
          //        _days=7;
          //       }
          //       break;
          //
          //       case 2: {
          //         _isSelected=[false,false,true];
          //         _days=30;
          //       }
          //       break;
          //     }
          //     git.getRepoList(_days);
          //   });
          //
          //   },),
            Container(decoration: BoxDecoration(color: Colors.lightGreen[200],border: Border.all(width: 2,color: Colors.lightGreen),borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Select the record duration: ',style: TextStyle(
                  fontFamily: "Spartan",
                  fontWeight: FontWeight.w600,
                  fontSize: 18 ,
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
                      DropdownMenuItem(child: new Text('Weekly'), value: 'weekly'),
                      DropdownMenuItem(child: new Text('Monthly'), value: 'monthly')
                    ],

                    onChanged: (value){
                      setState(() {
                        _selectedItem=value;
                        switch(value){
                          case 'today':
                            {
                              _days = 1;
                              break;
                            }
                          case 'weekly':{
                            _days=7;
                            break;
                          }
                          case 'monthly':{
                            _days=30;
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
      height: MediaQuery.of(context).size.height*0.8,
      width: MediaQuery.of(context).size.width,
      child: Observer(builder: (_) {
        return git.mystate == StoreState.loaded
            ?
        // Scrollbar(
        //       child:
              ListView.builder(
                controller: controller,
                  itemCount: git.repoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListItem(git.repoList[index]);
                  })
          //  )
            : Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
  // getlist() async{
  //
  //   final lastWeek = DateTime.now().subtract(Duration(days: 7));
  //   final formattedDate = formatDate(lastWeek, [yyyy, '-', mm, '-', dd]);
  //   final uri = Uri.https("api.github.com", '/search/repositories', {
  //     'q': 'created:>$formattedDate',
  //     'sort': 'stars',
  //     'order': 'desc',
  //     'page': '0',
  //     'per_page': '25'
  //   });
  //   final jsonResponse = await _getJson(uri);
  //   print(jsonResponse);
  // }
  // static Future<Map<String, dynamic>> _getJson(Uri uri) async {
  //   final HttpClient _httpClient = HttpClient();
  //   try {
  //     final httpRequest = await _httpClient.getUrl(uri);
  //     final httpResponse = await httpRequest.close();
  //     if (httpResponse.statusCode != HttpStatus.OK) {
  //       return null;
  //     }
  //
  //     final responseBody = await httpResponse.transform(utf8.decoder).join();
  //     return json.decode(responseBody);
  //   } on Exception catch (e) {
  //     print('$e');
  //     return null;
  //   }
  // }
  // void _scrollListener() {
  //   print(controller.position.extentAfter);
  //   if (controller.position.extentAfter < 500) {
  //    // setState(() {
  //      // git.repoList.addAll(new List.generate(42, (index) => 'Inserted $index'));
  //       git.getRepoList(_count);
  //       _count+=25;
  //   //  });
  //   }
  // }
}
