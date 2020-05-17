import 'package:flutter/material.dart';
import 'package:hubb/api/github_flutter_users.dart';
import 'package:hubb/models/github_users.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url;

  Future<GithubUsers> _getGitUser() async {
    var response = await LoadGitUsers.getUser();
    return response;
  }

  @override
  void initState() {
    super.initState();
    _getGitUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Github Users'),
          backgroundColor: Color(0XFF2F3035),
        ),
        body: SingleChildScrollView(
            child: FutureBuilder(
                future: _getGitUser(),
                builder: (BuildContext context,
                  AsyncSnapshot<GithubUsers> snapshot) {
                  var items = snapshot.data.items;
                  return items.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: items.length,
                          padding: const EdgeInsets.all(15.0),
                          itemBuilder: (context, int index) {
                            return Column(
                              children: <Widget>[
                                SizedBox(height: 5.0),
                                ListTile(
                                  leading: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.teal,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "${items[index].owner.avatarUrl}"),
                                      radius: 28,
                                    ),
                                  ),
                                  title: Text('${items[index].name}'),
                                  subtitle: Text('Location not found'),
                                  trailing: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: OutlineButton(
                                        onPressed: () async {
                                          url = '${items[index].owner.htmlUrl}';
                                          if (await canLaunch(url)) {
                                            await launch(url,
                                                forceSafariVC: false);
                                          } else {
                                            throw 'Could not launch $url';
                                          }
                                        },
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Text('View Profile'),
                                            ),
                                            Icon(FontAwesomeIcons.githubAlt,size:18),
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Divider(height: 5.0),
                              ],
                            );
                          })
                      : CircularProgressIndicator();
                })));
  }
}
