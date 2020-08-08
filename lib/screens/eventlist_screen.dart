import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/notification_item.dart';
import '../providers/notification.dart';

class EventListScreen extends StatefulWidget {
  @override
  _EventListScreenState createState() => _EventListScreenState();
}

class _EventListScreenState extends State<EventListScreen> {
  var _isLoading = false;

  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    Provider.of<Notifications>(context, listen: false)
        .fetchNotifs()
        .then((_) => setState(() {
              _isLoading = false;
            }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notifs = Provider.of<Notifications>(context);
    final loadedNotifs = notifs.notifItems;

    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            child: Text(
              'EVENTS',
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: _isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: loadedNotifs.length,
                    itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
                      value: loadedNotifs[index],
                      child: NotificationItem(),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
