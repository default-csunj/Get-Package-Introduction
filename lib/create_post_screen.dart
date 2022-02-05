// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_introduction/view_model/post_view_model.dart';

class CreatePostScreen extends StatelessWidget {
  CreatePostScreen({Key? key}) : super(key: key);

  final PostViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a post"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.people), hintText: "Name"),
              controller: viewModel.tecName,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.comment), hintText: "Caption"),
              controller: viewModel.tecCapt,
              
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  viewModel.storePost();
                },
                child: viewModel.isLoading.value
                    ? Container(
                      height: 20,
                      width: 20,
                      child: Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        )),
                    )
                    : Text("Create"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
