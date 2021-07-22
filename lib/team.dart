import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  Map pictures = {
    "Latif Khan": "latif.jpeg",
    "Mohammad Ateek Samma": "ateek.jpeg",
    "Lokesh Sharma": "lokesh.jpeg",
    "Shubham Vagrecha": "shubham.jpeg",
    "Sheetal Sharma": "sheetal.jpeg",
  };
  @override
  Widget build(BuildContext context) {
    List temp = pictures.keys.toList();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          "Medi Squad",
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
            for (int i = 0; i < temp.length; i++)
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 45,
                            child: Image.asset(
                              'assets/${pictures[temp[i]]}',
                              height: 80,
                              width: 80,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '${temp[i]}',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Architect',
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
