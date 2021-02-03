import 'package:flutter/material.dart';
import 'noContacts.dart';

class ContactListing extends StatelessWidget {
  final List contacts;
  final VoidCallback onAdd;
  final Function(String id) onDelete;
  ContactListing({this.onAdd,this.contacts,this.onDelete});
  @override
  Widget build(BuildContext context) {
    return contacts.isEmpty? 
      NoContact(
        onAdd: onAdd
      )
      :ListView(
      children:[
        ...contacts.map<Widget>(
          (contact) =>Padding(
            padding: const EdgeInsets.symmetric(vertical:10),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Text('SA'),
              ),
              title: Text(contact['name']),
              trailing: FlatButton(
                onPressed:(){
                  onDelete(contact['name']);
                },
                child:Icon(
                  Icons.delete,
                  size: 30,
                ) ,
              )
            ),
        )
      )
      .toList(),
      SizedBox(height: 80)
      ]
    );
  }

}