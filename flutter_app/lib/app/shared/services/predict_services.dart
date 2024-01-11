import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:njha_bird_detect/app/models/bird.dart';
import 'package:njha_bird_detect/app/models/bird_family.dart';
import 'package:njha_bird_detect/app/models/bird_order.dart';
import 'package:njha_bird_detect/app/models/bird_status.dart';
import 'package:njha_bird_detect/app/shared/services/api_config.dart';
import 'package:njha_bird_detect/app/shared/utils/storage.dart';

Future<List<Bird>> handlePrediction(File file) async {
  try {
    final response = await prediction(file);
    var results = response as List<dynamic>;

    final List<Bird> birds = [];
    for (var element in results) {
      element['confidence'] = element['confidence'].toDouble();
      birds.add(Bird.fromJson(element));
    }
    return birds;
  } catch (e) {
    rethrow;
  }
}

Future<dynamic> prediction(File imageFile) async {
  final url = ApiConfig.ENDPOINT['prediction']!['index']!;
  var request = http.MultipartRequest('POST', Uri.parse(url));
  var stream = http.ByteStream(imageFile.openRead());
  var length = await imageFile.length();
  var multipartFile = http.MultipartFile('file', stream, length,
      filename: imageFile.path.split('/').last);
  request.files.add(multipartFile);
  final accessToken = await getLocalStorage('accessToken');

  if (accessToken != null) {
    request.headers['Authorization'] = 'Bearer $accessToken';
  }

  var responseStream = await request.send();
  var response = await http.Response.fromStream(responseStream);
  print(response.body);
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception("Opps, Something went wrong");
  }
}
