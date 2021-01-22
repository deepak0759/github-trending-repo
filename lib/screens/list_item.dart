import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_trending/model/item.dart';
import 'package:github_trending/screens/details.dart';
import 'package:github_trending/store/github_store.dart';
import 'package:github_trending/utils/app_constants.dart';

import 'package:provider/provider.dart';

class ListItem extends StatefulWidget {
  Item listItem;
  ListItem(this.listItem);
  @override
  _ListItemState createState() => _ListItemState(listItem);
}

class _ListItemState extends State<ListItem> {
  GitStore git;
  void initState() {
    super.initState();
    git ??= Provider.of<GitStore>(context, listen: false);
  }

  Item listItem;
  _ListItemState(this.listItem);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: Colors.green[50],
      child: Column(
        children: [
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(listItem),
                ),
              );
            },
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: SizedBox(
                          width: 18, height: 18, child: Image.asset(GIT_PATH)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(listItem.full_name,
                          style: TextStyle(
                            fontFamily: "Spartan",
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            color: Colors.blueAccent,
                          ),
                          softWrap: true),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Text('By @${listItem.owner.login}',
                      style: TextStyle(
                        fontFamily: "Spartan",
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        decoration: TextDecoration.none,
                        color: Colors.grey,
                      )),
                )
              ],
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                children: [
                  SizedBox(
                    width: 18,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(listItem.watchers_count.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: SizedBox(
                        width: 18, height: 18, child: Image.asset(LANG_PATH)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: Text(listItem.language == null
                        ? 'No Info'
                        : '${listItem.language}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: SizedBox(
                        width: 18, height: 18, child: Image.asset(FORK_PATH)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(listItem.forks.toString()),
                  )
                  //Icon(Icons.bra)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
