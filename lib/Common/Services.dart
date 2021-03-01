import 'dart:convert';

import 'package:dio/dio.dart';

String API = 'http://116.72.17.66:8090/MCSCAMobileAshirwadPaintAPI/api/master/';

Dio dio = new Dio();

class Services {
  static Future<List> item(body) async {
    String url = API + 'item';
    print("item URL: " + url);
    try {
      Response response = await dio.post(url, data: body);

      if (response.statusCode == 200) {
        List list = [];
        print("item URL: " + response.data.toString());
        var memberDataClass = jsonDecode(response.data);
        if (memberDataClass["success"] == true &&
            memberDataClass["auth"] == true) {
          print(memberDataClass["data"]);
          list = memberDataClass["data"];
        }
        return list;
      } else {
        throw Exception(MESSAGES.INTERNET_ERROR);
      }
    } catch (e) {
      print("item Error : " + e.toString());
      throw Exception(MESSAGES.INTERNET_ERROR);
    }
  }
}

class MESSAGES {
  static const String INTERNET_ERROR = "No Internet Connection";
  static const String INTERNET_ERROR_RETRY =
      "No Internet Connection.\nPlease Retry";
}
