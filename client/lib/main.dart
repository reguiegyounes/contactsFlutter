import 'package:flutter/material.dart';
import 'package:client/src/contactsScreen.dart';
import 'package:client/src/api.dart';
void main() {
  final api=ContactsApi();
  print(api.getContacts());
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts List',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ContactScreen(title: 'Contacts List'),
    );
  }
}
