import 'dart:convert';

import 'package:harry_potter_challenge/models/feature_flag.dart';
import 'package:http/http.dart';

Future<List<FeatureFlag>> findAllFeatures() async {
  var url = Uri.parse('http://192.168.0.175:8080/transactions');
  final Response response = await get(url);
  final List<dynamic> decodedJson = jsonDecode(response.body);
  final List<FeatureFlag> features = [];
  for (Map<String, dynamic> element in decodedJson) {
    final FeatureFlag feature = FeatureFlag(
      feature: element['feature'],
      active: element['active'],
    );
    features.add(feature);
  }
  return features;
}
