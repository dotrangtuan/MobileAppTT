import 'dart:convert';
import 'package:http/http.dart' as http;

//Auth token we will use to generate a meeting and connect to it
String token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiJkZThhOTQzYS04YzBiLTQ1MzMtYmViZS1iMmRjMDM1MTU0YjciLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTY5NTQzNjc0NiwiZXhwIjoxNjk2MDQxNTQ2fQ.iEiOH9wXy9SVP2WgZwKg5_hZPF-03Tr7lcSUnZWN0pA";

// API call to create meeting
Future<String> createMeeting() async {
  final http.Response httpResponse = await http.post(
    Uri.parse("https://api.videosdk.live/v2/rooms"),
    headers: {'Authorization': token},
  );

//Destructuring the roomId from the response
  return json.decode(httpResponse.body)['roomId'];
}