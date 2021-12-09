import 'package:cloud_firestore/cloud_firestore.dart';

class EventEntry {
  EventEntry(
    this.summary,
  );

  String summary;
  
  Map<String, dynamic> toJson() {
    return {
      'summary': summary,
    };
  }
  
  Future<void> abc() async {
    await FirebaseFirestore.instance
      .collection('posts')
      .doc()
      .set({
        'summary': 'Hello World',
      });
  }
}
