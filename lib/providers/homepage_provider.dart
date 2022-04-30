import 'package:flutter/foundation.dart';
import 'package:provider_demo/models/post.dart';

class HomePageProvider extends ChangeNotifier {
  bool _isProccesing = true;
  List<Post> _postList = [];

  bool get isProcessing => _isProccesing;

  setIsProccessing(bool value) {
    _isProccesing = value;
    notifyListeners();
  }

  List<Post> get postList => _postList;

  setIsPostList(List<Post> list) {
    _postList = list;
    notifyListeners();
  }

  mergePostsList(List<Post> list) {
    _postList.addAll(list);
    notifyListeners();
  }

  Post getPostByIndex(int index) => _postList[index];
}
