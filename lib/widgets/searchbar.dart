import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(2.0),
        ),
      ),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IconButton(
              onPressed: null,
              icon: Icon(Icons.search),
              color: Colors.grey,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Want something specific?"),
                onSubmitted: (String place) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
