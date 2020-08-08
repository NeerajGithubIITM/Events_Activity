import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/eventlist_screen.dart';
import './providers/notification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Notifications(),
      child: MaterialApp(
        home: EventListScreen(),
      ),
    );
  }
}
