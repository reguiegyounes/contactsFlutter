import 'package:flutter/material.dart';

class NoContact extends StatelessWidget {
  final VoidCallback onAdd;
  NoContact({this.onAdd});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person_outline,
              size: 80,
              color: Colors.black45,
            ),
            Text(
              'No contacts listed',
            ),
            FlatButton(
              onPressed: onAdd,
              child: Text(
                'Add your first',
                style: TextStyle(fontSize: 20,color: Colors.white),
              ),
              color: Colors.blue,
            )
          ],
        ),
      );
  }
}