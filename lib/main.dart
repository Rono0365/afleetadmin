import 'package:afleetadmin/fees.dart';
import 'package:afleetadmin/notification.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'fleetcons.dart';
import 'hw.dart';
import 'students.dart';
import 'reportbook.dart';
import 'splashscreen.dart';
import 'notification.dart';

//this is gonna make me some money
//import 'Splashscreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Afleetadmin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: screen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
    required this.titlex,
    required this.tokenx,
    required this.useridx,
  }) : super(key: key);
//titlex: 'Afleet', tokenx: PassToken, useridx: ID
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String titlex;
  final String tokenx;
  final String useridx;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var gohard;
  var gohard2;
  var profpic;
  var sky2;
  Future getMe() async {
    String token = widget.tokenx.toString();
    String id = widget.useridx.toString();
    //int cv = int.parse(id) - 1;

    print('here' + token);
    print('here' + id);
    //print(widget.token); wasn't easy but never stopped
    var headers = {
      'Authorization': 'Token $token',
    };
    http.Response responsev = await http
        .get(Uri.parse('https://afleet.co.ke/me/$id'), headers: headers);
    var xcv = jsonDecode(responsev.body);
    setState(() {
      sky2 = xcv;
      //here you'll get the value of the username
      //the usernbame is unique thus you can use it as nany user driver// teacher // student
      // value = sky2;
    });
    print(sky2);
  }

  Future createAlbumd() async {
    http.Response response1 = await http.get(
      Uri.parse('https://afleet.co.ke/classes/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    http.Response responsex = await http.get(
      Uri.parse('https://afleet.co.ke/Subjects/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    final picpic = await http.get(
      Uri.parse('https://afleet.co.ke/profpic/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    var token = jsonDecode(response1.body);
    var magix = jsonDecode(picpic.body);

    var mc = jsonDecode(responsex.body);
    print(token);
    print(mc);
    setState(() {
      gohard = token;
      gohard2 = mc;
      profpic = magix;
    });

    print("<><><><><><>" + gohard.toString());
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    this.getMe();
    createAlbumd();
    print(sky2);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return gohard == null
        ? Scaffold(
            body: Center(
            child: CircularProgressIndicator(),
          ))
        : Scaffold(
            appBar: AppBar(
                leading: Container(),
                centerTitle: true,
                elevation: 0.0,
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: Text("Teacher's companion"),
                actions: [
                  // Chip(avatar:(Icon(Icons.person)),label:Text("Teacher"))
                ]),
            body: SingleChildScrollView(
              child: Column(children: [
                // Text(sky2.toString()),
                ...gohard.map((er) => er['owner'] == sky2['username']
                    ? Card(
                        child: SingleChildScrollView(
                        child: Column(children: [
                          Text(er['school'].toString() + ".",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          ListTile(
                            trailing: Stack(children:[

                              ...profpic.map(
                                                (ui) => ui['username1'] ==
                                                        sky2['username']
                                                    ? InkWell(
                                                      onTap: (){
                                                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => chang(
                                      username:
                                      sky2['username'].toString(),
                                    )));
                                                        //

                                                      },
                                                      child: CircleAvatar(
                                                          radius: 17,
                                                          backgroundColor:
                                                              Colors.transparent,
                                                    
                                                          backgroundImage:
                                                              NetworkImage(
                                                            ui['image'],
                                                          ), //ui['image'],
                                                        ),
                                                    )
                                                    : SizedBox(),
                                              ),
                                              Positioned(
                                                bottom: -1,
                                                right: 0,
                                                child: CircleAvatar(backgroundColor: Colors.white,radius:8,child: CircleAvatar(radius:7,
                                              backgroundColor: Colors.deepPurple,
                                                child: Center(child: Icon(Icons.camera_alt,size: 10,color: Colors.white,),
                                              ),)))
                            ])
,
                            
                            subtitle: Text(er['name'].toString()),
                            title: Text("Teacher",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * .8,
                              child: GridView.extent(
                                primary: false,
                                padding: const EdgeInsets.all(16),
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                                maxCrossAxisExtent: 200.0,
                                children: <Widget>[
                                  InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.deepPurple.withOpacity(0.2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                10.0) //                 <--- border radius here
                                            ),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Column(children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(children: [
                                          SizedBox(
                                            width: 7,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors
                                                .deepPurpleAccent
                                                .withOpacity(0.1),
                                            radius: 28,
                                            child: Icon(Icons.school,
                                                color: Colors.deepPurple),
                                          )
                                        ]),
                                        SizedBox(
                                          height: 52,
                                        ),
                                        Row(children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('Homework',
                                              style: TextStyle(fontSize: 20)),
                                        ]),
                                      ]),
                                    ),
                                    onTap: () {
                                      //er['students']
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => hw(
                                                  first: gohard2.toList(),
                                                  ht: '[${er['name']},${er['school']}]'))); //MaterialPageRoute
                                    },
                                  ),
                                  InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.deepPurple.withOpacity(0.2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                10.0) //                 <--- border radius here
                                            ),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Column(children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(children: [
                                          SizedBox(
                                            width: 7,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors
                                                .deepPurpleAccent
                                                .withOpacity(0.1),
                                            radius: 28,
                                            child: Icon(Icons.mail,
                                                color: Colors.deepPurple),
                                          )
                                        ]),
                                        SizedBox(
                                          height: 52,
                                        ),
                                        Row(children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('Message',
                                              style: TextStyle(fontSize: 20)),
                                        ]),
                                      ]),
                                      // color: Colors.deepPurple.withOpacity(0.2),
                                    ),
                                    onTap: () {
                                      //er['students']
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => mef(
                                                  first: er['students'],
                                                  klass: er['name'])));
                                    },
                                  ),
                                  InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.deepPurple.withOpacity(0.2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                10.0) //                 <--- border radius here
                                            ),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Column(children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(children: [
                                          SizedBox(
                                            width: 7,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors
                                                .deepPurpleAccent
                                                .withOpacity(0.1),
                                            radius: 28,
                                            child: Icon(
                                                Icons.notifications_outlined,
                                                color: Colors.deepPurple),
                                          )
                                        ]),
                                        SizedBox(
                                          height: 52,
                                        ),
                                        Row(children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('Notification',
                                              style: TextStyle(fontSize: 20)),
                                        ]),
                                      ]),
                                      //color: Colors.deepPurple.withOpacity(0.2),
                                    ),
                                    onTap: () {
                                      /**String title;
  String myname; //restaurant name
  //String imageme;
  String token; //ofcouse this is for pass grant
  String user; //this is the user
 */
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => FriendMess(
                                                  title: 'Class Notificatin',
                                                  lf: '[${er['name']},${er['school']}]',
                                                  token: '',
                                                  myname: '${er['name']}',
                                                  user: ''
                                                  //             first: er['students'],
                                                  )));
                                    },
                                  ),
                                  InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.deepPurple.withOpacity(0.2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                10.0) //                 <--- border radius here
                                            ),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Column(children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(children: [
                                          SizedBox(
                                            width: 7,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors
                                                .deepPurpleAccent
                                                .withOpacity(0.1),
                                            radius: 28,
                                            child: Icon(Icons.group_outlined,
                                                color: Colors.deepPurple),
                                          ),
                                        ]),
                                        SizedBox(
                                          height: 52,
                                        ),
                                        Row(children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('Students',
                                              style: TextStyle(fontSize: 20)),
                                        ]),
                                      ]),
                                      //color: Colors.deepPurple.withOpacity(0.2),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => rb(
                                                    second: gohard2.toList(),
                                                    first:
                                                        er['students'].toList(),
                                                  )));
                                      //er['students']
                                    },
                                  ),
                                  InkWell(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color:
                                            Colors.deepPurple.withOpacity(0.2),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(
                                                10.0) //                 <--- border radius here
                                            ),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Column(children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(children: [
                                          SizedBox(
                                            width: 7,
                                          ),
                                          CircleAvatar(
                                            backgroundColor: Colors
                                                .deepPurpleAccent
                                                .withOpacity(0.1),
                                            radius: 28,
                                            child: Icon(Icons.monetization_on,
                                                color: Colors.deepPurple),
                                          ),
                                        ]),
                                        SizedBox(
                                          height: 52,
                                        ),
                                        Row(children: [
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text('Fees',
                                              style: TextStyle(fontSize: 20)),
                                        ]),
                                      ]),
                                      //color: Colors.deepPurple.withOpacity(0.2),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => mefees(
                                                    first: er['students'],
                                                  )));
                                    },
                                  ),
                                ],
                              )),
                        ]),
                      ))
                    : Container())
              ]),
            ));
  }
}
