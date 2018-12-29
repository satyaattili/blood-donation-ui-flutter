import 'package:blooddonation/blood_thumbnail.dart';
import 'package:flutter/material.dart';

class RecentUpdateListWidget extends StatelessWidget {
  final String receiverName;
  final String receiverAge;
  final String receiverSex;
  final String receiverDistance;
  final String postedAtTime;

  const RecentUpdateListWidget({
    Key key, this.receiverName, this.receiverAge, this.receiverSex, this.receiverDistance, this.postedAtTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      decoration: new BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.white54,
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
            EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            child: BloodGroupThumbnailWidget(),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  receiverName != null ? receiverName : "Ronald Dixin",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                child: Text(
                  getSecondlineDesc(),
                  style: TextStyle(color: Colors.black87, fontSize: 15.0),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  String getSecondlineDesc(){
    String age  = receiverAge != null ? receiverAge : '24';
    String sex  = receiverSex != null ? receiverSex : 'Male';
    String distance  = receiverDistance != null ? receiverDistance : '20KM';
    String time  = postedAtTime != null ? postedAtTime : '22Hrs';
    return '$age * $sex * $distance * $time';
  }

}
