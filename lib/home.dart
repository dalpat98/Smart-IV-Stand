import 'package:flutter/material.dart';
import 'package:medi_squad/team.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Stream<http.Response> getRandomNumberFact() async* {
    yield* Stream.periodic(Duration(seconds: 5), (_) {
      return http.get(
          "https://api.thingspeak.com/channels/1182986/feeds.json?api_key=VL3I67HB56TB65V9&results=2");
    }).asyncMap((event) async => await event);
  }

  Stream<http.Response> getRandomNumberFact2() async* {
    yield* Stream.periodic(Duration(seconds: 5), (_) {
      return http.get(
          'https://api.thingspeak.com/update?api_key=3PGDO66RR6CLQ35I&field1=0');
    }).asyncMap((event) async => await event);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Smart IV Stand",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              fontFamily: 'Architect'),
        ),
        elevation: 0.7,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        color: Colors.black12,
        child: ListView(
          children: <Widget>[
            Center(
              child: Text(
                'Ward-1',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[900]),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            StreamBuilder<http.Response>(
              stream: getRandomNumberFact(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      color: double.parse(json
                                                  .decode(snapshot.data.body)[
                                                      "feeds"][0]["field1"]
                                                  .toString()
                                                  .split(r"\")[0]) >=
                                              75.0
                                          ? Colors.green
                                          : Colors.red),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Weight :  ${double.parse(json.decode(snapshot.data.body)["feeds"][0]["field1"].toString().split(r"\")[0])}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Name:    Govind Sharma',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown),
                                ),
                                Text(
                                  'Bed :  1',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Fetching Data....',
                              style: TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    ),
            ),
            StreamBuilder<http.Response>(
              stream: getRandomNumberFact2(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Card(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  height: 80,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      color: double.parse(snapshot.data.body) >=
                                              75.0
                                          ? Colors.green
                                          : Colors.red),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  'Weight :  ${snapshot.data.body}',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Name:    Mitali Malviya',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.brown),
                                ),
                                Text(
                                  'Bed :  2',
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purple),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: Colors.black,
            child: Container(
              margin: const EdgeInsets.all(20.0),
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40,
                    child: Image.asset(
                      'assets/logo.jpeg',
                      height: 56,
                      width: 56,
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    'Smart IV Stand',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Architect',
                        color: Colors.white),
                  ),
                  Text(
                    'Healthcare Project',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: 'Architect'),
                  )
                ],
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(1.0),
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.home,
                      size: 24,
                      color: Colors.grey[700],
                    ),
                    Text(
                      '    Home',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: EdgeInsets.all(1.0),
              child: ListTile(
                title: Row(
                  children: <Widget>[
                    Icon(
                      Icons.group,
                      size: 24,
                      color: Colors.grey[700],
                    ),
                    Text(
                      '    Team Details',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeamPage()),
                  );
                },
              ),
            ),
          ),
          Divider(
            color: Colors.black26,
            indent: 15,
            endIndent: 15,
          ),
          SizedBox(
            height: 50,
          ),
          Center(
            child: Text(
              '2021 \u00a9 DC Collection, All Rights Reserved',
              style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
