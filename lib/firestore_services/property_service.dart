import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:propertypulse/models/property_model.dart';


class PropertyService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> addProperty(PropertyModel property) async {
    try {
      await _firestore.collection('properties').add(property.toJson());
    } catch (e) {
      print(e);
    }
  }



  Future<List<PropertyModel>> getProperty() async {
    final QuerySnapshot snapshot = await _firestore.collection('properties').get();

    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return PropertyModel.fromJson(data);
    }).toList();
  }



}

