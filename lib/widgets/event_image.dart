import 'package:flutter/material.dart';

class EventImage extends StatelessWidget {
  final String imageUrl;

  EventImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: imageUrl.length == 0 || !imageUrl.endsWith('.png')
                ? null
                : Image.network(
                    imageUrl,
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
                    onPressed: (){},
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
                    onPressed: (){},
                    icon: Icon(Icons.favorite),
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
