import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:core';
import 'package:intl/intl.dart';

import 'package:http/http.dart' as http;

class hw extends StatefulWidget {
  const hw({Key? key, required this.first, required this.ht}) : super(key: key);
  final List first;
  final String ht;
  @override
  State<hw> createState() => _hwState();
}

class _hwState extends State<hw> {
  var now;
  var leo;
  List chatdata = [];
  final scrollController = ScrollController();
  final titleController = TextEditingController();
  final titleControlle = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Future createAlbum(String k) async {
      print(utf8.encode(titleController.text));
      http.Response response1 = await http.post(
        Uri.parse('https://afleet.co.ke/HW/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        }, //'id','sender','message_me','receiver','time'
        body: jsonEncode(<String, String>{
          /** name = models.CharField(max_length=100,default = 'no') #headline
    date = models.CharField(max_length=100,default = 'no') #date
    subject */
          //'id': titleController.text,this is an autofield
          'name': titleControlle.text, //an actual title
          'date': now.toString(), //class teacher
          'subject': k,
          'lass': widget.ht,
        }),
      );
      //print(jsonDecode(response1.data.toString()) );
      //works => print(token['token']);

      if (response1.statusCode == 201) {
        print("yea it happened");
        print(jsonDecode(response1.body.toString()));
      }
      ;

      //});
//save the token for next time
    }

    void rono2(String k) {
      showDialog(
          //student id card here
          context: context,
          builder: (context) {
            /*  Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop(true);
            });*/
            return AlertDialog(
                title: Container(
                  //height: MediaQuery.of(context).size.width * 0.08,
                  //color: Colors.purple,
                  width: double.infinity,
                  child: Center(
                    child: TextField(
                      keyboardType: TextInputType.text,
                      autofocus: true,
                      maxLines: null,
                      onChanged: (value) {
                        setState(() {
                          //DateFormat('EEEE').format(date);
                          this.now =
                              DateFormat('EEEE d MMM').format(DateTime.now());
                          //returns json body from api
                          //this.courseblock = result1;
                          this.leo = DateFormat.jm().format(DateTime.now());
                        });
                        enabled:
                        false;
                      },

                      //void man => value.toString();

                      decoration: InputDecoration(
                          // prefixIcon: Icon(Icons.storefront),
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          hintText: 'title',
                          hintStyle: TextStyle(color: Colors.grey[900]),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0))),
                      controller: titleControlle,
                    ),
                  ),
                ),
                content: Container(
                    height: 320.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                        child: Column(children: <Widget>[
                          Text(
                            "",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width * 0.15,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.86,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.0),
                                  topRight: Radius.circular(30.0),
                                  bottomLeft: Radius.circular(30.0),
                                  bottomRight: Radius.circular(30.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0),
                                    spreadRadius: 0,
                                    blurRadius: 0,
                                  )
                                ],
                              ),
                              child: FlatButton(
                                  onPressed: (() {
                                    createAlbum(k);
                                    //getWeather3x();

                                    titleController.clear();
                                    titleControlle.clear();
                                    Navigator.pop(context);
                                    /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => regS()));*/
                                  }),
                                  child: Text(
                                    "Send",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 23,
                                        color: Colors.white),
                                  )),
                            ),
                          )
                        ]))));
          });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Homework"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ...widget.first.map((i) => Column(children: [
                    ListTile(
                      leading: Icon(Icons.book_sharp),
                      trailing: InkWell(
                          child: Icon(Icons.add),
                          onTap: () {
                            rono2(i['headline'].toString());
                          }),
                      title: Text(i['headline'].toString()),
                    )
                    //...i['Subjects'].take(5).map((g)=>ListTile(title: Text(g['headline'].toString())))
                  ])
              //ListTile(title: Text(i['Subjects'].toString()))

              )
        ]
            // widget.first.toString()
            ),
      ),
    ); //Container();
  }
}
