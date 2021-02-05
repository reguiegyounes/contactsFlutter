import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'contactListing.dart';
import 'api.dart';
import 'model/contactModel.dart';




class ContactScreen extends StatefulWidget {
  ContactScreen({Key key, this.title}) : super(key: key);
  final String title;
  final ContactsApi api=ContactsApi();
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  
  List<Contact> contacts=[];
  bool loading =true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    widget.api.getContacts()
    .then((data){
        setState(() {
          loading=false;
          contacts=data;
          
        });
      }
    );

    
  }


  void _addContact() {
    setState(() {
      final faker=Faker();
      final person=faker.person;
      final fullName='${person.firstName()} ${person.lastName()}';

      contacts.add(Contact.fromJson({'name':fullName}));
    });
  }
  void _deleteContact(String id) {
    setState(() {
      contacts.removeWhere((contact) => contact.id==id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body:loading?Center(child:CircularProgressIndicator())
      :ContactListing(
        contacts: contacts,
        onAdd: _addContact,
        onDelete: _deleteContact,
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