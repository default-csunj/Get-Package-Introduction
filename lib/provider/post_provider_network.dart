import 'package:dio/dio.dart';
import 'package:get_introduction/data/post_data_model.dart';

class PostProviderNetwork {
  late Dio request =
      Dio(BaseOptions(baseUrl: "http://192.168.100.15:8000/api"));

  Future<List<Post>> getPost() async {
    List<Post> posts = [];

    try {
      var response = await request.get(
        '/posts/guests',
      );

      var datas = response.data['data'];

      datas.forEach((data) {
        Post postItem = Post(
          name: data['name'],
          caption: data['caption'],
        );

        posts.add(postItem);
      });
    } catch (e) {
      print(e);
    }

    return posts;
  }

  Future<Response> storePost(String name, String caption) async {
    var response = await request.post('/posts/guests',
        options: Options(headers: {"Accept": "application/json"}),
        data: FormData.fromMap({"name": name, "caption": caption}));
    return response;
  }
}
