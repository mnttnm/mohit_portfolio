import 'package:dio/dio.dart';

void sendSlackMessage(Map<String, dynamic> message) async {
  const slackWebHookURL = String.fromEnvironment('SLACK_WEBHOOK_URL');

  if (slackWebHookURL.isEmpty) {
    throw Exception('Could not send the message');
  }

  final response = await Dio().post(
    slackWebHookURL,
    data: message.toString(),
  );

  print(response.statusCode);
}
