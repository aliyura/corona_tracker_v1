import 'package:flutter/material.dart';
import 'package:CoronaTracker/advices.dart';
import 'screens/about.dart';
import 'screens/feedback.dart';
import 'screens/invite_friend.dart';
import 'screens/rate_app.dart';
import 'components/themes.dart';
import 'package:CoronaTracker/google_map_base.dart';
import 'package:CoronaTracker/stats.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Corona Virus Tracker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppTheme.background,
          cursorColor: AppTheme.background,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }),
        ),
        home: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Added
      initialIndex: 0, //Added
      child: Scaffold(
        appBar: AppBar(
          title: Text('Corona Virus Tracker'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "Tracker",
              ),
              Tab(
                text: "Map Stats",
              ),
              Tab(
                text: "Advices",
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FeedbackScreen()));
              },
              icon: Icon(
                Icons.comment,
                size: 16,
              ),
              label: Text("Feedback"),
              textColor: AppTheme.white,
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: UserAccountsDrawerHeader(
                  accountName: Text('Corona Tracker v0.0.1'),
                  accountEmail: Text('info@coronatracker.com'),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: AppTheme.nearlyBlack.withOpacity(0.5),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(color: AppTheme.background),
                ),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutScreen()));
                  },
                  child: ListTile(
                    title: Text('About'),
                    leading: Icon(Icons.help),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FeedbackScreen()));
                  },
                  child: ListTile(
                    title: Text('Feedback'),
                    leading: Icon(Icons.message),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InviteFriend()));
                  },
                  child: ListTile(
                    title: Text('Invite Friend'),
                    leading: Icon(Icons.share),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ReateAppScreen()));
                  },
                  child: ListTile(
                    title: Text('Reate App'),
                    leading: Icon(Icons.star),
                  )),
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            StatsPage(),
            BaseGoogleMap().getWidget(),
            AdvicesPage(),
          ],
        ),
      ),
    );
  }
}
