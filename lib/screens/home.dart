import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_demo/helpers/api_helper.dart';
import 'package:provider_demo/models/post.dart';
import 'package:provider_demo/providers/homepage_provider.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  _showSnackbar({required String message, required Color bgColor}) {
    _globalKey.currentState!.showSnackBar(
        SnackBar(content: Text(message), backgroundColor: bgColor));
  }

  // _hideSnackbar() {
  //   _globalKey.currentState.hideCurrentSnackBar();
  // }

  _getPosts() async {
    var provider = Provider.of<HomePageProvider>(context, listen: false);
    var response = await Apihelper.getPosts();
    if (response.isSuccessful!) {
      provider.setIsPostList(response.data!);
    } else {
      _showSnackbar(message: response.message!, bgColor: Colors.red);
    }
    provider.setIsProccessing(false);
  }

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Provider REST')),
        body: Consumer<HomePageProvider>(
            builder: (_, provider, __) => provider.isProcessing
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: provider.postList.length,
                    itemBuilder: (_, index) {
                      Post post = provider.getPostByIndex(index);

                      return ListTile(
                        title: Text(post.title!),
                        subtitle: Text(post.body!,
                            maxLines: 2, overflow: TextOverflow.ellipsis),
                      );
                    })));
  }
}
