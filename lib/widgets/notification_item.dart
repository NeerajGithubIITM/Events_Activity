import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'event_image.dart';
import 'event_details.dart';
import '../providers/notification_object.dart';

class NotificationItem extends StatefulWidget {
  @override
  _NotificationItemState createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  var _isExpanded = false;

  void _toggleExpanded() {
    setState(
      () {
        _isExpanded = !_isExpanded;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleExpanded,
      child: Card(
        margin: EdgeInsets.only(
          top: 15,
          bottom: 15,
          left: 10,
          right: 10,
        ),
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Consumer<NotificationObject>(
          builder: (ctx, notifOb, _) => Column(
            children: <Widget>[
              EventImage(notifOb.image),
              if (_isExpanded)
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 20,
                        right: 20,
                      ),
                      child: Container(
                        child: Text(notifOb.description),
                      ),
                    ),
                    if (notifOb.link.length != 0)
                      Container(
                        child: Text('link: ${notifOb.link}'),
                      ),
                  ],
                ),
              EventDetails(
                notifOb.title,
                notifOb.location,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
