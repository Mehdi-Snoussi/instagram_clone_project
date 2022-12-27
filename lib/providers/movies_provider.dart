import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier {
  List<dynamic> list = [];
  bool isLoading = false;

  Future getMovies() async {
    isLoading = true;
    var url =
        Uri.parse("https://63a9ef9e7d7edb3ae61ca8cc.mockapi.io/movies/movie");
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      isLoading = false;
      list = jsonResponse;
      if (kDebugMode) {
        print('response: $list.');
      }
    } else {
      if (kDebugMode) {
        isLoading = false;
        print('Request failed with status: ${response.statusCode}.');
      }
    }
    notifyListeners();
  }

  onPressedBookmark(int index) {
    list[index]["bookmarked"] = !list[index]["bookmarked"];
    notifyListeners();
  }
}
