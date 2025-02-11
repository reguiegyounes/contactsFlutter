import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
    String id;
    String name;

    Contact({
        this.id,
        this.name,
    });

    String get initials{
      final names=name.split(' ');
      var shortCut='';
      for (var i = 0; i < names.length; i++) {
        shortCut=shortCut+names[i].substring(0,1);
      }
      return shortCut;
    }

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json['_id'],
        name: json['name'],
    );

    Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
    };
}
