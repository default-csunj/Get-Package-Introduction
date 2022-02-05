// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_introduction/create_post_screen.dart';
import 'package:get_introduction/view_model/post_view_model.dart';

class PostScreen extends StatelessWidget {
  final PostViewModel viewModel = Get.put(PostViewModel());

  PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    viewModel.getPost();
    return Scaffold(
        appBar: AppBar(
          title: Text("Posts Screen"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Get.to(() => CreatePostScreen());
              },
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            viewModel.getPost();
          },
          child: Obx(() {
            return SafeArea(
              child: Container(
                child: viewModel.isLoading.value
                    ? Center(
                        child: Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            color: Colors.blue,
                          ),
                        ),
                      )
                    : ListView(
                        children: viewModel.posts
                            .map(
                              (post) => Card(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Column(
                                    children: [
                                      Container(
                                          child: Row(
                                        children: [
                                          Container(),
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],
                                      )),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          post.caption,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child:
                                            Text("ditulis oleh ${post.name}"),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Divider(
                                        color: Colors.black,
                                      ),
                                      Container(
                                          child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Row(
                                                children: [
                                                  IconButton(
                                                    icon: Icon(
                                                        Icons
                                                            .favorite_border_outlined,
                                                        color: Colors.black),
                                                    onPressed: () {},
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text("5")
                                                ],
                                              ),
                                              SizedBox(width: 15),
                                              Row(
                                                children: const [
                                                  Icon(Icons
                                                      .mode_comment_outlined),
                                                  SizedBox(width: 5),
                                                  Text(" Comments")
                                                ],
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: const [
                                              Icon(Icons.share_outlined),
                                              SizedBox(width: 5),
                                              Text("Share")
                                            ],
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
              ),
            );
          }),
        ));
  }
}
