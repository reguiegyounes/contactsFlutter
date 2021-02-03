import 'package:flutter/material.dart';
import 'contactListing.dart';




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

class ContactScreen extends StatefulWidget {
  ContactScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  
  List contacts=[];

  void _addContact() {
    setState(() {
      contacts.add({'name':'smith'});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body:ContactListing(
        contacts: contacts,
        onAdd: _addContact,
        ),
      floatingActionButton:Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){},
            tooltip: 'Refresh List',
            child: Icon(Icons.refresh),
            backgroundColor: Colors.purple
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: _addContact,
            tooltip: 'Add new contact',
            child: Icon(Icons.person_add),
          
          ), 
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}