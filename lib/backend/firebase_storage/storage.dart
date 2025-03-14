import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:mime_type/mime_type.dart';

Future<String?> uploadData(String path, Uint8List data) async {
  print('path: $path');
  final storageRef = FirebaseStorage.instance.ref().child(path);
  // final storageRef = FirebaseStorage.instance.ref(path);
  final metadata = SettableMetadata(contentType: mime(path));
  final result = await storageRef.putData(data, metadata);
  return result.state == TaskState.success ? result.ref.getDownloadURL() : null;

  // final storageRef = FirebaseStorage.instance.ref().child(path);
  // final metadata = SettableMetadata(contentType: mime(path));
  // UploadTask uploadTask = storageRef.putData(data, metadata);
  //
  // TaskSnapshot snapshot = await uploadTask;
  // if (snapshot.state == true) {
  //   return await snapshot.ref.getDownloadURL();
  // } else {
  //   return null;
  // }
}
