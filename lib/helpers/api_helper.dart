import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:provider_demo/models/http_response.dart';
import 'package:provider_demo/models/post.dart';

class Apihelper {
  static Future<HTTPResponse<List<Post>>> getPosts(
      {int limit = 20, int page = 1}) async {
    String url =
        'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page';

    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<Post> postList = [];
        body.forEach((element) {
          Post post = Post.fromJson(element);
          postList.add(post);
        });

        return HTTPResponse(
            isSuccessful: true,
            data: postList,
            responseCode: response.statusCode);
      } else {
        return HTTPResponse(
            data: null,
            isSuccessful: false,
            message:
                "invalid response received from  server! Please try again, later. ");
      }
    } on SocketException {
      return HTTPResponse(
          isSuccessful: false,
          data: null,
          message: "unable to reach the internet! Please try again, later.");
    } on FormatException {
      return HTTPResponse(
          isSuccessful: false,
          data: null,
          message:
              "invalid response received from  server! Please try again, later. ");
    } catch (e) {
      return HTTPResponse(
          isSuccessful: false,
          data: null,
          message: "Something went wrong! Please try again, later.");
    }
  }
}
