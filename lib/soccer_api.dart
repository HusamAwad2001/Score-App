//before let's add the http package
import 'dart:convert';

import 'package:http/http.dart';
import 'package:score_app/soccer_match.dart';

class SoccerApi {
  final String apiUrl =
      "https://v3.football.api-sports.io/fixtures?season=2020&league=39";
  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    //Always make sure to check the api key and the limit of a request in a free api
    'x-rapidapi-key': "PUT YOUR API KEY HERE OR IT WILL NOT WORK"
  };

  Future<List<SoccerMatch>> getAllMatches() async {
    var url = Uri.parse(apiUrl);
    Response res = await get(url, headers: headers);
    var body;

    if (res.statusCode == 200) {
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      print("Api service: ${body}"); // to debug
      List<SoccerMatch> matches = matchesList
          .map((dynamic item) => SoccerMatch.fromJson(item))
          .toList();

      return matches;
    } else {
      return [];
    }
  }
}
