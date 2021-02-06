
import 'package:mongo_dart/mongo_dart.dart';
import 'package:sevr/sevr.dart';
import 'package:server/api/model/contactModel.dart';


main(List<String> args) {
  start();
}



void start() async {
  try {
    final db=await Db.create('mongodb+srv://admin:1234@cluster0.lf2qc.mongodb.net/dbContact?retryWrites=true&w=majority');
    await db.open();
    final coll =db.collection('contacts');

    
    // server
    const port=8081;
    final serv=Sevr();

    serv.options('/', [
      (req,res){
        setCors(req, res);
        return res.status(200);
      }
    ]);
    serv.options('/:id', [
      (req,res){
        setCors(req, res);
        return res.status(200);
      }
    ]);

    serv.get('/', [
      setCors,
      (ServRequest request,ServResponse response) async{
        
        final contacts=await coll.find().toList();
        return response.status(200).json({'contacts':contacts});
        
      }
    ]);

    serv.post('/', [
      setCors,
      (ServRequest request,ServResponse response) async{

        final contact=Contact(name:request.body['name']);
        await coll.save(contact.toJson());
        return response.json(
          await coll.findOne(where.eq('name',request.body['name']))
          );
      }
    ]);


    serv.delete('/:id', [
      setCors,
      (ServRequest request,ServResponse response) async{

        await coll.remove(
          where.eq('_id', ObjectId.fromHexString(request.params['id']))
        );
        return response.status(200);
      }
    ]);


    //listen for connection
    serv.listen(port,callback: (){
      print('Server listening on port : $port');
    });


  } catch (e) {
    print(e);
  }
  
 
  
}
void setCors(ServRequest request,ServResponse response) async{
    response.response.headers.add('Access-Control-Allow-Origin', '*');
    response.response.headers.add('Access-Control-Allow-Methods', 'GET, POST, DELETE');
    response.response.headers.add('Access-Control-Allow-Headers', 'Origin, Content-Type');

}