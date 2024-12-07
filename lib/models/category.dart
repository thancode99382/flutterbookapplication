import 'package:cloud_firestore/cloud_firestore.dart';

class Category{
  final String id;
  final String name;
  final String imageUrl;
  final DateTime createdAt;

  Category( { required this.id, required this.name, required this.imageUrl, required this.createdAt,});


  factory Category.fromMap(String id,Map<String,dynamic> data){
    return Category(
      id:id??'',
      name:data['name'],
      imageUrl:data['imageUrl'],
      createdAt: (data['createAt'] as Timestamp?)?.toDate()??DateTime.now()
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'name':name,
      'imageUrl':imageUrl,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

}