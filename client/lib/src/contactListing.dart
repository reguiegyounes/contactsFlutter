import 'package:flutter/material.dart';
import 'noContacts.dart';
import 'model/contactModel.dart';

class ContactListing extends StatelessWidget {
  final List<Contact> contacts;
  final VoidCallback onAdd;
  final Function(String id) onDelete;

  String  initialsName(String name){
      final names=name.split(' ');
      var shortCut='';
      for (var i = 0; i < names.length; i++) {
        shortCut=shortCut+names[i].substring(0,1);
      }
      return shortCut;
    }
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
                child: Text(initialsName(contact.name).toUpperCase()),
              ),
              title: Text(contact.name),
              trailing: FlatButton(
                onPressed:(){
                  onDelete(contact.id);
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