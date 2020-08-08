import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'notification_object.dart';

class Notifications with ChangeNotifier {
  List<NotificationObject> _notifItems = [];

  List<NotificationObject> get notifItems {
    return [..._notifItems];
  }

  Future<void> fetchNotifs() async {
    final url =
        "https://students.iitm.ac.in/studentsapp/general/get_notifs.php";

    try {
      final response = await http.get(url);
      
      final extractedData =
          json.decode(response.body) as List;

      

      _notifItems = extractedData
          .map(
            (notifObject) => NotificationObject(
              id: notifObject['id'],
              title: notifObject['title'],
              description: notifObject['description'],
              topic: notifObject['topic'],
              image: notifObject['image'],
              link: notifObject['link'],
              location: notifObject['location'],
            ),
          )
          .toList();


      notifyListeners();
    } catch (error) {}
  }
}
