import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/notification_item.dart';
import '../widgets/searchbar.dart';
import '../widgets/button_row.dart';
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
      body: Container(
        padding: EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 30),
        child: Column(
          children: <Widget>[
            Container(
              child: Text(
                'EVENTS',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SearchBar(),
            SizedBox(
              height: 10,
            ),
            ButtonRow(),
            SizedBox(
              height: 10,
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
            )
          ],
        ),
      ),
    );
  }
}
