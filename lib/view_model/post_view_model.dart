import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_introduction/data/post_data_model.dart';
import 'package:get_introduction/data/profile_data_model.dart';
import 'package:get_introduction/provider/post_provider_network.dart';
import 'package:get_introduction/provider/profile_provider_network.dart';

class PostViewModel extends GetxController {
  PostProviderNetwork postProvider = PostProviderNetwork();
  ProfileProviderNetwork profileProvider = ProfileProviderNetwork();

  var posts = List<Post>.empty().obs;

  var profile = List<Profile>.empty().obs;

  var isLoading = false.obs;

  TextEditingController tecName = TextEditingController();
  TextEditingController tecCapt = TextEditingController();

  Future<void> getPost() async {
    isLoading.value = true;
    posts.value = await postProvider.getPost();
    isLoading.value = false;
  }

  Future<void> getProfile() async {
    profile.value = await profileProvider.getProfile();
  }

  Future storePost() async {
    isLoading.value = true;

    try {
      await postProvider.storePost(tecName.text, tecCapt.text);
      posts.value = await postProvider.getPost();
      Get.back();

      tecName.clear();
      tecCapt.clear();
      Get.snackbar(
        "Success",
        "Data berhasil dimasukan",
        backgroundColor: Colors.white70,
        borderWidth: 2,
        borderColor: Colors.black38,
        colorText: Colors.green,
      );
    } catch (e) {
      if (e is DioError) {
        Map<dynamic, dynamic> errorData = e.response!.data["errors"];

        List keys = errorData.keys.toList();
        print(keys);
        if (keys.isNotEmpty) {
          String key = keys[0];

          Get.snackbar(e.response!.data["message"].toString(),
              errorData[key][0].toString(),
              backgroundColor: Colors.white70,
              borderWidth: 2,
              borderColor: Colors.black38,
              colorText: Colors.red);
        }
      } else {
        Get.snackbar("Error!", "Something Went Wrong!",
            backgroundColor: Colors.white70,
            borderWidth: 2,
            borderColor: Colors.black38);
      }
    }
    isLoading.value = false;
  }
}
