import 'package:flutter/material.dart';

class parSelection extends StatefulWidget {
  const parSelection({Key? key}) : super(key: key);

  @override
  _parSelectionState createState() => _parSelectionState();
}

class _parSelectionState extends State<parSelection> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Par Value"),
        ),
        body: GridView.count(
          crossAxisCount: 1,
          children: List.generate(3, (index) {
            return Container(
              margin: EdgeInsets.all(70),
              decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(120),
                onTap: () {
                  Navigator.pop(context, (index + 3));
                },
                child: Align(
                  child: Text(
                    "${index + 3}",
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
