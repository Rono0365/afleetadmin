import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class rb extends StatefulWidget {
  const rb({Key? key, required this.first, required this.second})
      : super(key: key);
  final List first;
  final List second;
  @override
  State<rb> createState() => _rbState();
}

class _rbState extends State<rb> {
  @override
  Widget build(BuildContext context) {
    final titleControlle = TextEditingController();
    void rono2() {
      showDialog(
          //student id card here
          context: context,
          builder: (context) {
            /*  Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop(true);
            });*/
            return AlertDialog(
              elevation: 0,
                content: SingleChildScrollView(
                    child: Column(children: [
                       Container(
                            //height: MediaQuery.of(context).size.width * 0.08,
                            //color: Colors.purple,
                            width: MediaQuery.of(context).size.width,

                            child: ListTile(
                              title: Text(widget.second[0]['headline'].toString()),
                              subtitle: TextField(
                                keyboardType: TextInputType.text,
                                autofocus: true,
                                maxLines: null,
                                onChanged: (value) {
                                  enabled:
                                  false;
                                },

                                //void man => value.toString();

                                decoration: InputDecoration(
                                    // prefixIcon: Icon(Icons.storefront),
                                    filled: true,
                                    fillColor: Colors.blueGrey[50],
                                    hintText: 'grade',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[900]),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0))),
                                controller: titleControlle,
                              ),
                            ),
                          ),
                          Container(
                            //height: MediaQuery.of(context).size.width * 0.08,
                            //color: Colors.purple,
                            width: MediaQuery.of(context).size.width,

                            child: ListTile(
                              title: Text(widget.second[1]['headline'].toString()),
                              subtitle: TextField(
                                keyboardType: TextInputType.text,
                                autofocus: true,
                                maxLines: null,
                                onChanged: (value) {
                                  enabled:
                                  false;
                                },

                                //void man => value.toString();

                                decoration: InputDecoration(
                                    // prefixIcon: Icon(Icons.storefront),
                                    filled: true,
                                    fillColor: Colors.blueGrey[50],
                                    hintText: 'grade',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[900]),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0))),
                                controller: titleControlle,
                              ),
                            ),
                          ),Container(
                            //height: MediaQuery.of(context).size.width * 0.08,
                            //color: Colors.purple,
                            width: MediaQuery.of(context).size.width,

                            child: ListTile(
                              title: Text(widget.second[2]['headline'].toString()),
                              subtitle: TextField(
                                keyboardType: TextInputType.text,
                                autofocus: true,
                                maxLines: null,
                                onChanged: (value) {
                                  enabled:
                                  false;
                                },

                                //void man => value.toString();

                                decoration: InputDecoration(
                                    // prefixIcon: Icon(Icons.storefront),
                                    filled: true,
                                    fillColor: Colors.blueGrey[50],
                                    hintText: 'grade',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[900]),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0))),
                                controller: titleControlle,
                              ),
                            ),
                          ),Container(
                            //height: MediaQuery.of(context).size.width * 0.08,
                            //color: Colors.purple,
                            width: MediaQuery.of(context).size.width,

                            child: ListTile(
                              title: Text(widget.second[3]['headline'].toString()),
                              subtitle: TextField(
                                keyboardType: TextInputType.text,
                                autofocus: true,
                                maxLines: null,
                                onChanged: (value) {
                                  enabled:
                                  false;
                                },

                                //void man => value.toString();

                                decoration: InputDecoration(
                                    // prefixIcon: Icon(Icons.storefront),
                                    filled: true,
                                    fillColor: Colors.blueGrey[50],
                                    hintText: 'grade',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[900]),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0))),
                                controller: titleControlle,
                              ),
                            ),
                          ),Container(
                            //height: MediaQuery.of(context).size.width * 0.08,
                            //color: Colors.purple,
                            width: MediaQuery.of(context).size.width,

                            child: ListTile(
                              title: Text(widget.second[4]['headline'].toString()),
                              subtitle: TextField(
                                keyboardType: TextInputType.text,
                                autofocus: true,
                                maxLines: null,
                                onChanged: (value) {
                                  enabled:
                                  false;
                                },

                                //void man => value.toString();

                                decoration: InputDecoration(
                                    // prefixIcon: Icon(Icons.storefront),
                                    filled: true,
                                    fillColor: Colors.blueGrey[50],
                                    hintText: 'grade',
                                    hintStyle:
                                        TextStyle(color: Colors.grey[900]),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0))),
                                controller: titleControlle,
                              ),
                            ),
                          ),
                          Container(
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
                            height: MediaQuery.of(context).size.width * 0.15,
                            child: Container(
                              //width: MediaQuery.of(context).size.width * 0.86,
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
                              child: FloatingActionButton(
                                  onPressed: (() {
                                    // createAlbum();
                                    //getWeather3x();
                                    // getWeather3x();
                                    // getWeather3x();
                                    //             titleController.clear();
                                    //           titleControlle.clear();
                                    Navigator.pop(context);
                                    /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => regS()));*/
                                  }),
                                  child: Icon(Icons.add)),
                            ),
                          )
                        ])))
                    ]),
                  
                ),
                //: 
                );
          });
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Students"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          ...widget.first.map((i) => Column(children: [
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text(i['firstname'] + " " + i['lastname']),
                      /*trailing: InkWell(
                          child: Icon(Icons.add),
                          onTap: () {
                            rono2();
                          }),*/
                    ),
                  ])
              //ListTile(title: Text(i['Subjects'].toString()))

              )
        ]
            // widget.first.toString()
            ),
      ),
    );
  }
}
