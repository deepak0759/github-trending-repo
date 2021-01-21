import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_trending/model/item.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatelessWidget {
  Item item;
  Details(this.item);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail'),
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
           // mainAxisAlignment: MainAxisAlignment.center,
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
                  placeholder: 'assets/loading.gif',
                  image: item.owner.avatar_url==null?'assets/default':item.owner.avatar_url,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width:120,
                      child: Text('Name : ',
                          style:
                          Theme.of(context).textTheme.headline1),
                    ),
                    Container(width: 230,
                      child: Text(item.name,
                          style: Theme.of(context).textTheme.headline6),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width:120,
                      child: Text('Owner : ',
                          style:
                          Theme.of(context).textTheme.headline1),
                    ),
                    Text(item.owner.login,
                        style: Theme.of(context).textTheme.headline6)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width: 120,
                      child: Text('Description : ',
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(width: 230,
                      child: Text(item.description!=null?item.description:"No Information",maxLines: 500,
                          style: Theme.of(context).textTheme.headline6),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width:120,
                      child: Text('Open Issues : ',
                          style:
                          Theme.of(context).textTheme.headline1),
                    ),
                    Text(item.open_issues.toString(),
                        style: Theme.of(context).textTheme.headline6)
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width:120,
                      child: Text('Link : ',
                          style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(width: 230,
                      child: InkWell(
                        child: Text(item.owner.html_url,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.blueAccent)),
                        onTap: () async{
                         var url=item.owner.html_url;
                          if (
                        await canLaunch(url))
                          await launch(url);
                          else
                          // can't launch url, there is some error
                          throw "Could not launch $url";},
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25,top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width:120,
                      child: Text('Git Url : ',
                          style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    Container(width: 230,
                      child: InkWell(
                        child: Text(item.clone_url,
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: Colors.blueAccent)),
                        onTap: () async{
                          var url=item.clone_url;
                          if (
                          await canLaunch(url))
                            await launch(url);
                          else
                            // can't launch url, there is some error
                            throw "Could not launch $url";},
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
