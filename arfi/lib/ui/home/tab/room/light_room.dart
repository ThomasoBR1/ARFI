import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LuzQuarto extends StatefulWidget {
  @override
  _LuzQuartoState createState() => _LuzQuartoState();
}

class _LuzQuartoState extends State<LuzQuarto> {
  bool _switchValue = false;
  bool _switchValues = false;

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
                'Luz da Sala',
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
                  FirebaseFirestore.instance
                      .collection('smart_home')
                      .doc('light')
                      .update({'living_room': _switchValue});
                });
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 2, left: 16),
              child: Text(
                'Luz do Quarto',
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
                  FirebaseFirestore.instance
                      .collection('smart_home')
                      .doc('light')
                      .update({'room': _switchValues});
                });
              },
            ),

          ],
        ),
      ),
    );
  }
}
