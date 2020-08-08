import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        child: Consumer<NotificationObject>(
          builder: (ctx, notifOb, _) => Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: notifOb.image.length == 0 ||
                              !notifOb.image.endsWith('.png')
                          ? null
                          : Image.network(
                              notifOb.image,
                              height: 300,
                              fit: BoxFit.cover,
                            ),
                    ),
                    Positioned(
                      top: 20,
                      right: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () => print('up arrow'),
                              icon: Icon(Icons.arrow_upward),
                              color: Colors.purple,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () => print('favorite'),
                              icon: Icon(Icons.favorite),
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              if (_isExpanded)
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
              Padding(
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
                    notifOb.title,
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
                      Text(notifOb.location),
                      SizedBox(
                        height: 1,
                      ),
                      Text('4:00 PM'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
