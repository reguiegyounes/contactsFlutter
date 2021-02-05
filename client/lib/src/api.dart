import 'package:dio/dio.dart';
import 'model/contactModel.dart';


class ContactsApi {
  final _dio=Dio(BaseOptions(baseUrl: 'http://localhost:8081/'));
  Future<List<Contact>> getContacts()async{
    final response=await _dio.get('');
    return (response.data['contacts'] as List)
      .map<Contact>( (json)=> Contact.fromJson(json) ).toList()  ;
  }
}
