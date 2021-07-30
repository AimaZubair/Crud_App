import 'package:flutter/material.dart';
import '../Homepage.dart';
import 'details.dart';

import 'package:http/http.dart' as http;

class EditData extends StatefulWidget {
  final List list;
  final int index;

  EditData({@required this.list, @required this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController id;
  TextEditingController name;
  TextEditingController email;
  TextEditingController mobile;
  TextEditingController address;
  void editData() {
    var url = "http://192.168.10.7/dashboard/crud/editdata.php";

    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "name": name.text,
      "mobile": mobile.text,
      "email": email.text,
      "address": address.text
    });
  }

  @override
  void initState() {
    id = new TextEditingController(text: widget.list[widget.index]['id']);
    name = new TextEditingController(text: widget.list[widget.index]['name']);
    email = new TextEditingController(text: widget.list[widget.index]['email']);
    mobile =
        new TextEditingController(text: widget.list[widget.index]['mobile']);
    address =
        new TextEditingController(text: widget.list[widget.index]['address']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Edit Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new TextField(
                  controller: name,
                  decoration: new InputDecoration(
                    labelText: "Name",
                  ),
                ),
                new TextField(
                  controller: email,
                  decoration: new InputDecoration(
                    labelText: "Email",
                  ),
                ),
                new TextField(
                  controller: mobile,
                  decoration: new InputDecoration(
                    labelText: "Mobile",
                  ),
                ),
                new TextField(
                  controller: address,
                  decoration: new InputDecoration(
                    labelText: "Address",
                  ),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new RaisedButton(
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(
                      new MaterialPageRoute(
                          builder: (BuildContext context) => Home()),
                    );
                  },
                  child: new Text(
                    "Edit  Data",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  color: Colors.blue,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
