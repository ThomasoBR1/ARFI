import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LuzQuarto extends StatefulWidget {
  @override
  _LuzQuartoState createState() => _LuzQuartoState();
}

class _LuzQuartoState extends State<LuzQuarto> {
  final DBRef = FirebaseDatabase.instance.reference();
  bool _switchValue = false;
  bool _switchValues = false;
  bool _switchValuess = false;
  bool _switch = false;
  bool _switc = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 32, left: 16),
              child: Text(
                'Luz 1',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Switch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                  DBRef.child("luz1").update({'data': _switchValue});
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 2, left: 16),
              child: Text(
                'Luz 2',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Switch(
              value: _switchValues,
              onChanged: (value) {
                setState(() {
                  _switchValues = value;
                  DBRef.child("luz2").update({'data': _switchValues});
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 2, left: 16),
              child: Text(
                'Luz 3',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Switch(
              value: _switchValuess,
              onChanged: (value) {
                setState(() {
                  _switchValuess = value;
                  DBRef.child("luz3").update({'data': _switchValuess});
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 2, left: 16),
              child: Text(
                'Luz 4',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Switch(
              value: _switch,
              onChanged: (value) {
                setState(() {
                  _switch = value;
                  DBRef.child("luz4").update({'data': _switch});
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 2, left: 16),
              child: Text(
                'Luz 5',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Switch(
              value: _switc,
              onChanged: (value) {
                setState(() {
                  _switc = value;
                  DBRef.child("luz5").update({'data': _switc});
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
