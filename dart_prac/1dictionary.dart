typedef PrintMsg = void Function(String msg);

class Dictionar {
  Dictionar._();
  PrintMsg out = print;

  var book = <String, String>{
    "apple": "사과",
  };
  late var word, mean;

  Dictionar.fromJson(Map<String, dynamic> dic)
      : word = dic.keys,
        mean = dic.values;

// count: 사전 단어들의 총 갯수를 리턴함.
  void count() {
    out("the count of dictionary is ${book.length}");
  }

// exists: 해당 단어가 사전에 존재하는지 여부를 알려줌.
  bool exists(word) {
    out("\n----- check if $word is existed -----");
    if (book.containsKey(word)) {
      out("$word is existed");
      return true;
    }
    out("$word is non-existed");
    return false;
  }

//add: 단어를 추가함.
  void add(String word, String mean) {
    out("$word is addded");
    final newWord = <String, String>{word: mean};
    book.addEntries(newWord.entries);
  }

// get: 단어의 정의를 리턴함.
  void get(word) {
    out("\n----- get word's mean -----");
    if (book.containsKey(word)) {
      out("${book[word]} is the meaning of the $word");
      return;
    }
  }

// update: 단어를 업데이트 함.
  void update(word, mean) {
    out("\n----- update word -----");
    book[word] = mean;
  }

// delete: 단어를 삭제함.
  void delete(word) {
    book.remove(word);
  }

// upsert 단어를 업데이트 함. 존재하지 않을시. 이를 추가함. (update + insert = upsert)
  void upsert(word, mean) {
    out("\n----- upsert word -----");

    //already existed
    if (book.containsKey(word)) {
      out("$word is already existed, then updated");
      book[word] = mean;
    }
    //non - existend
    else {
      out("$word is non-existed");
      add(word, mean);
    }
  }

// bulkAdd: 다음과 같은 방식으로. 여러개의 단어를 한번에 추가할 수 있게 해줌. [{"term":"김치", "definition":"대박이네~"}, {"term":"아파트", "definition":"비싸네~"}]
  void bulkAdd(List<Map<String, String>> newWords) {
    out("\n----- bulkAdd -----");
    for (var newWord in newWords) {
      //already existed
      if (book.containsKey(newWord.keys.first)) {
        book[newWord.keys.first] = newWord.values.first;
      }
      //non - existend
      else {
        add(newWord.keys.first, newWord.values.first);
      }
    }
  }

// bulkDelete: 다음과 같은 방식으로. 여러개의 단어를 한번에 삭제할 수 있게 해줌. ["김치", "아파트"]
  void bulkDelete(List<Map<String, String>> delWords) {
    out("\n----- bulkDelete -----");
    for (var delWord in delWords) {
      if (exists(delWord.keys.first)) {
        delete(delWord.keys.first);
      }
    }
  }

// showAll: 사전 단어를 모두 보여줌.
  void showAll() {
    book.forEach((key, value) {
      out('= $key: $value');
    });
  }
}

void main() {
  Dictionar dictionary = Dictionar._();

  dictionary.count();
  dictionary.exists("apple");
  print("\n----- add word -----");
  dictionary.add("banana", "바나나");
  dictionary.showAll();

  dictionary.get("banana");

  dictionary.update("apple", "사과들");
  dictionary.showAll();

  print("\n----- delete word -----");
  dictionary.delete("apple");
  dictionary.showAll();

  dictionary.upsert("banana", "바나낭");
  dictionary.showAll();

  dictionary.upsert("melon", "멜론");
  dictionary.showAll();

  dictionary.bulkAdd([
    {"peach": "복숭아"},
    {"straberry": "딸기"}
  ]);
  dictionary.showAll();

  dictionary.bulkDelete([
    {"peach": "복숭아"},
    {"straberry": "딸기"}
  ]);
  dictionary.showAll();
}
