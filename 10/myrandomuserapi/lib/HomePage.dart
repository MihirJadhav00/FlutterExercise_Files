import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List usersData;
  bool isLoading = true;
  final String url = "https://randomuser.me/api/?results=50";
  //whenever you are making web request <String> is optional mostly.
  Future getData() async {
    var response = await http.get(Uri.encodeFull(url),
        //header is totally optional
        headers: {"Accept": "application/json"});
    //results should be outside - we want our response to decode first then we need just results from it.
    List data = jsonDecode(response.body)['results'];

    setState(() {
      usersData = data;
      isLoading = false;
    });
  }

  //now as soon as our application loads up we will be having our data loaded.
  @override
  void initState() {
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Users"),
      ),
      body: Container(
        child: Center(
            child: isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    //extra safety check for null
                    itemCount: usersData == null ? 0 : usersData.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.all(20.0),
                              child: Image(
                                width: 70.0,
                                height: 70.0,
                                fit: BoxFit.contain,
                                image: NetworkImage(
                                    usersData[index]["picture"]["thumbnail"]),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    usersData[index]['name']['first'] +
                                        " " +
                                        usersData[index]['name']['last'],
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text("Phone: ${usersData[index]['phone']}"),
                                  Text("Gender: ${usersData[index]['gender']}"),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  )),
      ),
    );
  }
}

//ASSIGNMENT:
//1. Add Phone and Gender ICONS intead of the text
//2.Try to get more data and display it - age/email,etc
