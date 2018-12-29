import 'package:blooddonation/percentage_widget.dart';
import 'package:blooddonation/recent_update_list_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double bannerHeight, listHeight, listPaddingTop;
  double cardContainerHeight, cardContainerTopPadding;

  @override
  Widget build(BuildContext context) {
    bannerHeight = MediaQuery.of(context).size.height * .25;
    listHeight = MediaQuery.of(context).size.height * .75;
    cardContainerHeight = 200;
    cardContainerTopPadding = bannerHeight / 2;
    listPaddingTop = cardContainerHeight - (bannerHeight / 2);
    return Scaffold(
      // https://flutter.io/docs/development/ui/layout#stack
      body: Stack(
        children: <Widget>[
          new Column(
            children: <Widget>[
              topBanner(context),
              Expanded(child: bodyBloodRequestList(context))
            ],
          ),
          bannerContainer(),
          cardContainer(context),
        ],
      ),
    );
  }

  Container bodyBloodRequestList(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade300,
      padding:
          new EdgeInsets.only(top: listPaddingTop, right: 10.0, left: 10.0),
      child: Column(
        children: <Widget>[
          rowRecentUpdates(),
          Expanded(child: listRecentUpdates())
        ],
      ),
    );
  }

  ListView listRecentUpdates() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return RecentUpdateListWidget();
        });
  }

  Row rowRecentUpdates() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      verticalDirection: VerticalDirection.down,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Recent Updates",
              style: TextStyle(color: Colors.black87, fontSize: 17.0)),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("View All",
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 15.0)),
        )
      ],
    );
  }

  Container topBanner(BuildContext context) {
    return Container(
      height: bannerHeight,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        const Color.fromARGB(1000, 157, 37, 24),
        const Color.fromARGB(1000, 212, 47, 33),
      ])),
    );
  }

  Container bannerContainer() {
    return Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 50.0, right: 20.0, left: 20.0),
        child: Text(
          "Blood Requests",
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
        ));
  }

  Container cardContainer(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: new EdgeInsets.only(
          top: cardContainerTopPadding, right: 20.0, left: 20.0),
      child: Container(
        height: cardContainerHeight,
        width: MediaQuery.of(context).size.width,
        child: Container(
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                PercentageWidget(
                  size: 120.0,
                  title: 'Available',
                  count: 126,
                  percentage: 22,
                  countLeft: true,
                ),
                PercentageWidget(
                  size: 120.0,
                  title: 'Requests',
                  count: 248,
                  percentage: 56,
                  countLeft: false,
                ),
                SizedBox(
                  height: 60.0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
