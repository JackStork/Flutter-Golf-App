import 'package:flutter/material.dart';
import 'package:golf_app/holeInfo.dart';
import 'body.dart';

class popupInfo extends StatefulWidget {
  final holeInfo holes;

  popupInfo(this.holes);

  @override
  _popupInfoState createState() => _popupInfoState();
}

class _popupInfoState extends State<popupInfo> {
  int par() {
    return widget.holes.par.reduce((a, b) => a + b);
  }

  int score() {
    return widget.holes.score.reduce((a, b) => a + b);
  }

  String overUnder() {
    return (score() - par()).toString();
  }

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Par: ${par()}'),
            SizedBox(height: 20),
            Text('Score: ${score()}'),
            SizedBox(height: 20),
            Text('Over / Under: ${overUnder()}'),
          ],
        ),
      ),
    );
  }
}
