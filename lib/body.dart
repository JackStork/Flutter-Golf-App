import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'holeInfo.dart';
import 'parSelection.dart';
import 'scoreSelection.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var holes = new holeInfo();

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

  @override
  Widget build(BuildContext context) {
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
        ElevatedButton(
          child: Text("Round Information"),
          onPressed: () {},
        )
      ],
    );
  }
}
