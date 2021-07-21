import 'package:flutter/material.dart';

class scoreSelection extends StatefulWidget {
  const scoreSelection({Key? key}) : super(key: key);

  @override
  _scoreSelectionState createState() => _scoreSelectionState();
}

class _scoreSelectionState extends State<scoreSelection> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Score Value"),
        ),
        body: GridView.count(
          crossAxisCount: 1,
          children: List.generate(7, (index) {
            return Container(
              margin: EdgeInsets.all(70),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(120),
                onTap: () {
                  Navigator.pop(context, (index + 1));
                },
                child: Align(
                  child: Text(
                    "${index + 1}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      shadows: [
                        Shadow(
                          offset: Offset(2, 2),
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
