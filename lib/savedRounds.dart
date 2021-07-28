import 'package:flutter/material.dart';
import 'holeInfo.dart';
import 'body.dart';

class savedRounds extends StatefulWidget {
  const savedRounds({Key? key}) : super(key: key);

  @override
  _savedRoundsState createState() => _savedRoundsState();
}

class _savedRoundsState extends State<savedRounds> {
  List<holeInfo> roundList = [];

  void saveRound(holeInfo myHole) {
    this.setState(() {
      //Only add to list if it's a new round
      roundList.add(myHole);
    });
  }

  Future<void> newRound(holeInfo savedHole) async {
    this.setState(() {
      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Body(saveRound, savedHole)))
          .then((value) => setState(() => {}));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 80,
                child: Card(
                  elevation: 10,
                  child: InkWell(
                    onTap: () {
                      //Create a new holeInfo object every time 'new round' is pressed
                      var holes = new holeInfo();
                      print('New Hole: ${holes.newRound}');
                      newRound(holes);
                    },
                    child: Center(
                      child: Text("New Round",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22, color: Colors.grey)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        //savedRoundList(newRound, roundList),
        ListView.builder(
          shrinkWrap: true,
          itemCount: roundList.length,
          itemBuilder: (context, index) {
            return Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: Card(
                      elevation: 80,
                      child: InkWell(
                          onTap: () {
                            print('Saved Hole: ${roundList[index].newRound}');
                            newRound(roundList[index]);
                          },
                          child: Center(
                            child: Text(
                              'Par: ${roundList[index].par.reduce((a, b) => (a + b))}, Score: ${roundList[index].score.reduce((a, b) => a + b)}',
                              textAlign: TextAlign.center,
                            ),
                          )),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ],
    );
  }
}
