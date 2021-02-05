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

    

    factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        
        id: json['_id'].toString().replaceAll('ObjectId(\"','')
                                  .replaceAll('\")',''),
        name: json['name'],
    );

    Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
    };
}
