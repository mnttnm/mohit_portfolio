import 'package:dio/dio.dart';

Future<bool> sendSlackMessage(Map<String, dynamic> message) async {
  const apiURL = String.fromEnvironment('API_URL');

  if (apiURL.isEmpty) {
    throw Exception('Could not send the message');
  }

  try {
    //404
    await Dio().post(apiURL, data: {"text": message.toString()});
    return true;
  } on DioError catch (e) {
    if (e.response != null) {
      print(e.response!.data);
      print(e.response!.headers);
      print(e.response!.statusCode);
    } else {
      print(e.requestOptions);
      print(e.message);
    }
    return false;
  }
}
