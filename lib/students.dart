import 'package:flutter/material.dart';
import 'stuchat.dart';

class mef extends StatefulWidget {
  const mef({Key? key, required this.first,required this.klass}) : super(key: key);
  final List first;
  final String klass;
  @override
  State<mef> createState() => _mefState();
}

class _mefState extends State<mef> {
  @override
  Widget build(BuildContext context) {
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
                        title: Text(i['firstname'].toString() +
                            " " +
                            i['lastname'].toString()),
                        trailing: InkWell(child: Icon(Icons.message)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => FriendMess(
                                      title: widget.klass.toString(),
                                      token: '',
                                      myname: 'message',
                                      user: i['username'].toString()
                                      //             first: er['students'],
                                      )));
                        }),
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
