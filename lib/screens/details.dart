import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_trending/model/item.dart';
import 'package:github_trending/utils/app_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  Item item;
  Details(this.item);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DETAIL_TITLE),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        color: Colors.green[50],
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Text(
                  'Id : ${item.owner.id.toString()}',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.80,
                height: MediaQuery.of(context).size.height * 0.45,
                child: FadeInImage.assetNetwork(
                  placeholder: LOADING_PATH,
                  image: item.owner.avatar_url == null
                      ? DEFAULT_PATH
                      : item.owner.avatar_url,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      child: Text(NAME,
                          style: Theme.of(context).textTheme.headline1),
                    ),
                    Container(
                      width: 230,
                      child: Text(item.name,
                          style: Theme.of(context).textTheme.headline6),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      child: Text(OWNER,
                          style: Theme.of(context).textTheme.headline1),
                    ),
                    Text(item.owner.login,
                        style: Theme.of(context).textTheme.headline6)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      child: Text(DESCP,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: 230,
                      child: Text(
                          item.description != null ? item.description : NO_INFO,
                          maxLines: 500,
                          style: Theme.of(context).textTheme.headline6),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      child: Text(ISSUES,
                          style: Theme.of(context).textTheme.headline1),
                    ),
                    Text(item.open_issues.toString(),
                        style: Theme.of(context).textTheme.headline6)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      child: Text(LINK,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: 230,
                      child: InkWell(
                        child: Text(item.owner.html_url,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,fontStyle: FontStyle.italic)),
                        onTap: () async {
                          var url = item.owner.html_url;
                          if (await canLaunch(url))
                            await launch(url);
                          else
                            throw "Could not launch $url";
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      child: Text(GIT_URL,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      width: 230,
                      child: InkWell(
                        child: Text(item.clone_url,
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueAccent,fontStyle: FontStyle.italic)),
                        onTap: () async {
                          var url = item.clone_url;
                          if (await canLaunch(url))
                            await launch(url);
                          else
                            throw "Could not launch $url";
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
         ),
      ),
    );
  }
}
