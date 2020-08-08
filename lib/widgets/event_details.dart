import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  final String title;
  final String eventLocation;

  EventDetails(this.title, this.eventLocation);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 7),
      child: ListTile(
        leading: Container(
          width: 55,
          height: 80,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'JUL',
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    '19',
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                width: 8,
              ),
              VerticalDivider(
                thickness: 1,
              ),
            ],
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 3,
            ),
            Text(eventLocation),
            SizedBox(
              height: 1,
            ),
            Text('4:00 PM'),
          ],
        ),
      ),
    );
  }
}
