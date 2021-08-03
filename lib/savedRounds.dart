import 'package:flutter/material.dart';
import 'holeInfo.dart';
import 'body.dart';
import 'popupName.dart';

class savedRounds extends StatefulWidget {
  const savedRounds({Key? key}) : super(key: key);

  @override
  _savedRoundsState createState() => _savedRoundsState();
}

class _savedRoundsState extends State<savedRounds> {
  List<holeInfo> roundList = [];

  void saveRound(holeInfo myHole) {
    this.setState(() {
      //Only add to list if it's a new round; dictated in body.dart
      roundList.insert(0, myHole);
      //Sort the list by date each time a new item is added (not necessary ATM, can just add item to front off saved list)
      //roundList.sort((a, b) {
      //  return b.date.compareTo(a.date);
      //});
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

  String getDate(holeInfo thisHole) {
    String date = thisHole.date.month.toString() +
        '/' +
        thisHole.date.day.toString() +
        '/' +
        thisHole.date.year.toString();
    return date;
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
                      //newRound(holes);

                      //For the pop-up box for naming the round
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              popupName(saveRound, holes));
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
            holeInfo thisHole = roundList[index];
            return Row(
              children: <Widget>[
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: Card(
                      elevation: 80,
                      child: InkWell(
                        onTap: () {
                          newRound(roundList[index]);
                        },
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Center(
                                child: Text(
                                  thisHole.roundName,
                                  style: TextStyle(
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                            Center(
                              child: Text(
                                'Par: ${thisHole.par.reduce((a, b) => (a + b))}, Score: ${thisHole.score.reduce((a, b) => a + b)}, Date Created: ${getDate(thisHole)}',
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
