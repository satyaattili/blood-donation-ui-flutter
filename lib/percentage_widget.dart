import 'package:flutter/material.dart';

class PercentageWidget extends StatelessWidget{

  final double size;
  final int count;
  final int percentage;
  final String title;
  final bool countLeft;

  const PercentageWidget({Key key, this.size, this.count, this.percentage, this.title, this.countLeft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size,
        height: size,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              countLeft ? leftWidget() : rightWidget(),
              Text(title, style: TextStyle( fontSize: 16.0),),

            ],
          ),

        ),
    );
  }

  Row leftWidget() {
    return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Center(
                    child: Text('$count', style: TextStyle( fontSize: 35.0, fontWeight: FontWeight.bold)),
                  )
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text('$percentage %', style: TextStyle( fontWeight: FontWeight.bold,fontSize: 15.0, color: getPercentageColor(percentage)))
                  )
                )
              ],
            );
  }

  Row rightWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Center(
                child: Text('$percentage %', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0, color: getPercentageColor(percentage)))
            )
        ),
        Expanded(
            flex: 2,
            child: Center(
              child: Text('$count', style: TextStyle( fontSize: 35.0, fontWeight: FontWeight.bold)),
            )
        ),
      ],
    );
  }

}

Color getPercentageColor(int p){
  return p > 50.0 ? Colors.green : Colors.red;
}