import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert'; //to convert the String to JSON

class HomePage extends StatefulWidget {
  final String title;
  HomePage({Key key, @required this.title}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String url =
      "https://api.github.com/users"; //to be fixed. the url from where we have to fetch the data
  List data; //Because we will get data in the list format
  var isLoading = false;

  //because we want to load the data before anything else in the applcation opens.
  @override
  void initState() {
    super.initState();
    this.getjsondata();
  }

  //Future is just like the promises in JS. It is used because something is going to happen in furure and it promise to give the results in future
  //As we wanna do it asyncronously we use async.
  Future getjsondata() async {
    //here we have got a variable through which we can make any request.
    var response = await http.get(
      Uri.encodeFull(url),
    );
    // print(response.body);

    //Converting the request to actual data format
    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson;
      // print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text(
                    data[index]['login'],
                    style: TextStyle(fontSize: 20.0),
                  ),
                  subtitle: Text(data[index]['url']),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
