import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'holeInfo.dart';
import 'parSelection.dart';
import 'scoreSelection.dart';
import 'popUpButton.dart';

class Body extends StatefulWidget {
  final Function(holeInfo) callback;

  holeInfo holes;

  Body(this.callback, this.holes);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //var holes = new holeInfo();

  Future<void> updatePar(holeInfo holes, int index) async {
    var tempVal = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => parSelection()));
    if (tempVal is int) {
      holes.par[index] = tempVal;
    }
    this.setState(() {});
  }

  Future<void> updateScore(holeInfo holes, int index) async {
    var tempVal = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => scoreSelection()));
    if (tempVal is int) {
      holes.score[index] = tempVal;
    }
    this.setState(() {});
  }

  void saveRoundClick(holeInfo holes) {
    widget.callback(holes);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Golf Score App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            width: 40,
            child: Image.asset('assets/golfball.png'),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 200.0,
                child: new GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(
                    this.widget.holes.holeCount,
                    (index) {
                      return Card(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                title: Text("Hole ${index + 1}",
                                    style: TextStyle(fontSize: 22)),
                              ),
                            ),
                            Card(
                              elevation: 10,
                              child: InkWell(
                                onTap: () {
                                  updatePar(this.widget.holes, index);
                                },
                                child: ListTile(
                                  title: Text(
                                      "Par: ${this.widget.holes.par[index]}"),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 10,
                              child: InkWell(
                                onTap: () {
                                  updateScore(this.widget.holes, index);
                                },
                                child: ListTile(
                                  title: Text(
                                      "Score: ${this.widget.holes.score[index]}"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  child: Text("Round Information "),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            popupInfo(this.widget.holes));
                  },
                ),
                ElevatedButton(
                  child: Text("       Save Round       "),
                  //Can pop back to the other screen and add the holeInfo to the outer array of holeInfos
                  onPressed: () {
                    //Only add to the round list if new round
                    if (this.widget.holes.newRound) {
                      this.widget.holes.newRound = false;
                      saveRoundClick(this.widget.holes);
                    }
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
    return Column(
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 200.0,
            child: new GridView.count(
              crossAxisCount: 2,
              children: List.generate(
                holes.holeCount,
                (index) {
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text("Hole ${index + 1}",
                                style: TextStyle(fontSize: 22)),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              updatePar(holes, index);
                            },
                            child: ListTile(
                              title: Text("Par: ${holes.par[index]}"),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 10,
                          child: InkWell(
                            onTap: () {
                              updateScore(holes, index);
                            },
                            child: ListTile(
                              title: Text("Score: ${holes.score[index]}"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ElevatedButton(
              child: Text("Round Information "),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => popupInfo(holes));
              },
            ),
            ElevatedButton(
              child: Text("       Save Round       "),
              //Can pop back to the other screen and add the holeInfo to the outer array of holeInfos
              onPressed: () {
                return;
              },
            ),
          ],
        ),
      ],
    );
  }
}
*/

