// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

Future<double> uploadingCount(
  String fileUrl, // URL or path to the file in Firebase Storage
  FFUploadedFile
      uploadedFile, // Custom file structure (assumed to have bytes or File)
) async {
  try {
    final storage = FirebaseStorage.instance;

    // Prepare file data
    final fileBytes = uploadedFile.bytes; // File bytes (Uint8List)
    final filePath = fileUrl; // Path in Firebase Storage

    if (fileBytes == null || filePath.isEmpty) {
      throw Exception('Invalid file data or path');
    }

    final storageRef = storage.ref().child(filePath);

    // Start the upload task
    final uploadTask = storageRef.putData(fileBytes);

    // Track progress
    final completer = Completer<double>();

    uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
      // Calculate progress as a normalized value between 0 and 1
      final progress = snapshot.bytesTransferred / snapshot.totalBytes;
      print('Upload Progress: ${(progress * 100).toStringAsFixed(2)}%');

      if (snapshot.state == TaskState.success) {
        completer.complete(1.0); // Complete with 1.0
      }
    }, onError: (e) {
      completer.completeError(e); // Handle errors
    });

    return completer.future; // Wait for upload to finish
  } catch (e) {
    print('Error during upload: $e');
    return -1.0; // Return -1.0 on failure
  }
}
