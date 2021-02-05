import 'package:dio/dio.dart';


class ContactsApi {
  final _dio=Dio(BaseOptions(baseUrl: 'http://localhost:8081/'));
  Future<List> getContacts()async{
    final response=await _dio.get('');
    return response.data['contacts'];
  }
}
