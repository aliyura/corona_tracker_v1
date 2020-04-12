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
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Corona Virus Tracker',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DefaultTabController(
        length: 3,
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
          ),
          drawer: Drawer(
          child: ListView(
            children: <Widget>[
             
              InkWell(
                  onTap: () {
                    
                  },
                  child: ListTile(
                    title: Text('Home'),
                    leading: Icon(Icons.home),
                  )),
              InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutScreen()));
                  },
                  child: ListTile(
                    title: Text('About'),
                    leading: Icon(Icons.help),
                  )),
              InkWell(
                  onTap: () {
                    
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
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}