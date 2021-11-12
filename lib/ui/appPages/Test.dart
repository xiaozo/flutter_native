import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExerciseRecordAudioPage extends StatefulWidget {
  ExerciseRecordAudioPage({
    Key? key,
  }) : super(key: key);

  @override
  _ExerciseRecordAudioPageState createState() =>
      _ExerciseRecordAudioPageState();
}

class _ExerciseRecordAudioPageState extends State<ExerciseRecordAudioPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          title: Text(
            "练习",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(left: 30, right: 30),
          color: Colors.red,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                width: double.infinity,
                color: Colors.blue,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("cccc"),
                    Text("cccc"),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
