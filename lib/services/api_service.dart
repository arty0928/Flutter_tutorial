import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonfix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  //aync가 있어서 Future로 감싸기(Future: 작업이 당장 끝나지 않는다)
  //함수안의 코드를 기다렸다가 실행 -> Future
  ///List형태의 webtoonInstances를 return

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    //await을 쓸때에는 async 함수여야 함
    //await으로 get 요청 보내고 기다리기
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      //List를 반환하므로 for문 사용 가능
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
