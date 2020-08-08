import 'package:flutter/material.dart';
class NotificationObject with ChangeNotifier {
  final int id;
  final String title;
  final String description;
  final String topic;
  final String link;
  final String image;
  final String location;

  NotificationObject({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.topic,
    @required this.image,
    @required this.location,
    this.link,
  });
}