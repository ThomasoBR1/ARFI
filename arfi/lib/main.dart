import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  
  runApp(MyApp());
}

  var valCamp = FirebaseFirestore.instance.collection('Light').doc('doc');
 // var estado = valCamp.get().then((value) => null);
  

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A.R.F.I',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'A.R.F.I'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Switch(value: _switchValue, onChanged: (value){
            setState(() {
              _switchValue = value;
              FirebaseFirestore.instance.collection('Light').doc('doc').update({'turnOff':_switchValue});
            });
          })


          ],
        ),
      ),
      
    );
  }
}
