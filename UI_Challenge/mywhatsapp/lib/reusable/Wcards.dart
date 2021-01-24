// Reusable whatsapp card widget

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Wcards extends StatelessWidget {
  final String name, imageurl, time;
  Wcards(this.name, this.imageurl, this.time);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        maxRadius: 25,
        //foregroundColor is used to handle the situation when the image takes time to load or the user dosen't provide any image.
        foregroundColor: Colors.deepPurple,
        backgroundImage: NetworkImage(imageurl),
      ),
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(time),
    );
  }
}
