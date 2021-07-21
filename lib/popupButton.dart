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
  @override
  Widget build(BuildContext context) {
    return new AlertDialog(
      title: Text('${widget.holes.holeCount}'),
    );
  }
}
