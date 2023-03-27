import 'package:flutter/material.dart';
import 'package:toonfix/models/webtoon_model.dart';
import 'package:toonfix/services/api_service.dart';

class HomeScreen1 extends StatelessWidget {
  HomeScreen1({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  // List<WebtoonModel> webtoons = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        title: const Text(
          "오늘의 웹툰",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        //snapshot" 상태(로딩중인지, 에러가 났는지,,)
        builder: (context, snapshot) {
          //데이터가 불어와졌으면 =future finished, data responsed
          if (snapshot.hasData) {
            //많은 양의 데이터를 연속적으로 보여줄때 ListView
            //사용자가 보고 있는 화면의 데이터만 로딩 -> ListView.builder (seperated)
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
          }
          //Future을 기다리고(await 필요없음)
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index) {
        //List -> index로만 접근 가능
        print(index);
        var webtoon = snapshot.data![index];
        return Column(
          children: [Image.network(webtoon.thumb), headers: const {"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36",},
 Text(webtoon.title)],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
