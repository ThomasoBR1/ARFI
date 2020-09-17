import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LuzQuarto extends StatefulWidget {
  @override
  _LuzQuartoState createState() => _LuzQuartoState();
}

class _LuzQuartoState extends State<LuzQuarto> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
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
          Switch(value: _switchValue,
          onChanged: (value){
            setState((){
              _switchValue = value;
              FirebaseFirestore.instance
                        .collection('Light')
                        .doc('doc')
                        .update({'turnOff': _switchValue});
            });
          })
        ],
      ),
    );
  }
}
