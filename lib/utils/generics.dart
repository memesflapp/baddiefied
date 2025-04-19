import 'dart:math';

import 'package:flutter/material.dart';

double screenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double screenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

String generateRandomUsername() {
  const chars =
      'qwertyuioplkjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM0123456789';
  Random rnd = Random.secure();
  String generatedUserId = String.fromCharCodes(Iterable.generate(
      11, (_) => chars.codeUnitAt(rnd.nextInt(chars.length))));
  return "user_$generatedUserId";
}