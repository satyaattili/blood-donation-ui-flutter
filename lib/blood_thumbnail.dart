import 'package:flutter/material.dart';

class BloodGroupThumbnailWidget extends StatelessWidget{

  final String requirement;
  final String bloodGroup;

  const BloodGroupThumbnailWidget({Key key, this.requirement, this.bloodGroup}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Stack(
      children: <Widget>[
        Container(
          height: 120.0,
          width: 100.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.red,
                  alignment: Alignment.center,
                  child: Text(requirement != null ? requirement : "URGENT", style: TextStyle(color: Colors.white, )),
                ),
              ),
              Expanded(
                flex: 3,
                child:  Container(
                  alignment: Alignment.center,
                  color: Colors.black87,
                  child: Text(bloodGroup != null ? bloodGroup : "B+ve", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
              )
            ],
          )
        ),
      ],
    );
  }


}