import 'dart:convert';

import 'package:harry_potter_challenge/models/feature_flag.dart';
import 'package:http/http.dart';

Future <bool> findAllFeatures() async {
  var url = Uri.parse('http://192.168.0.175:8080/features');
  final Response response = await get(url);
  final  Map<String,dynamic> decodedJson = jsonDecode(response.body);
  print('Decoded Json $decodedJson');
  final bool active = decodedJson['active'];
  print('Active : $active');
  return active;
}
