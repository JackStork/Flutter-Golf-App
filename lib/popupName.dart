import 'package:flutter/material.dart';
import 'holeInfo.dart';
import 'body.dart';

class popupName extends StatefulWidget {
  final Function(holeInfo) callback;

  holeInfo holes;

  popupName(this.callback, this.holes);

  @override
  _popupNameState createState() => _popupNameState();
}

class _popupNameState extends State<popupName> {
  Future<void> newRound(holeInfo savedHole) async {
    this.setState(() {
      Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Body(widget.callback, savedHole)))
          .then((value) => setState(() => {}));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      content: SingleChildScrollView(
          child: Row(
        children: <Widget>[
          TextField(),
          ElevatedButton(
            onPressed: () {
              newRound(widget.holes);
            },
            child: Icon(Icons.arrow_forward),
          )
        ],
      )),
    );
  }
}
