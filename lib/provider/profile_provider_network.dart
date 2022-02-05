import 'package:dio/dio.dart';
import 'package:get_introduction/data/post_data_model.dart';
import 'package:get_introduction/data/profile_data_model.dart';

class ProfileProviderNetwork {
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

  Future<List<Profile>> getProfile() async {
    List<Profile> profiles = [];

    try {
      var response = await request.get(
        '/profile/guests',
      );
      
      var datas = response.data['data'];

      datas.forEach((data) {
        
        Profile profileItem = Profile(
          name: data['name'],
          caption: data['caption'],
        );

        profiles.add(profileItem);
      });
    } catch (e) {
      print(e);
    }
    
    return profiles;
  }

  Future<List<Profile>> storePost() async {
    List<Profile> profiles = [];

    try {
      var response = await request.get(
        '/profile/guests',
      );
      
      var datas = response.data['data'];

      datas.forEach((data) {
        
        Profile profileItem = Profile(
          name: data['name'],
          caption: data['caption'],
        );

        profiles.add(profileItem);
      });
    } catch (e) {
      print(e);
    }
    
    return profiles;
  }
}
