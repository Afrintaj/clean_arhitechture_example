import 'package:flutter/material.dart';
import 'package:flutter_example/features/UserList/domain/entity/user_list_entity.dart';
import 'package:flutter_example/features/UserList/presentation/bloc/bloc/user_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late UserListBloc userListBloc;
  late List<UserListData> userList;

  late List<String> filterTypes = [];

  String? title;
  var data = {
    "languages": [
      {"languageId": "6055a3-10-4203-9da8-63ae62a08c52", "name": "English"},
      {"languageId": "30d718-1eac-4b8e-9149-4fdb91497faf", "name": "Kannada"},
      {"languageId": "4bc713a9-9a9b-41a9-8d8a-e9f5ae3581", "name": "Marati"},
      {"languageId": "09139f8e-1c72-4686-9212-a8454e70f038", "name": "Hindi"}
    ]
  };

  @override
  void initState() {
    super.initState();
    userListBloc = BlocProvider.of<UserListBloc>(context);
    userList = [];
    filterTypes = ["All", "Ratings", "Opened", "Closed"];

    for(int i = 0; i< data["languages"]!.length; i++){
      print("${data["languages"]![i]["name"]}");
    }
   
  }

  @override
  void dispose() {
    super.dispose();
    userListBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserListBloc, UserListState>(
        bloc: userListBloc,
        builder: (context, state) {
          if (state is UserListInitial) {
            print("hello UserListInitial");
            return Scaffold(
              appBar: AppBar(
                title: const Text(
                  "User List",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state is UserListLoaded) {
            print("hello UserListLoaded");
            title = state.title;
            userList = state.userList;
          }
          return Scaffold(
              // backgroundColor: Colors.white70,
              appBar: AppBar(
                title: const Text(
                  "User List",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
              body: ListView(
                children: [
                  ListView.builder(
                      itemCount: userList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Shop Name : ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(userList[index].shopName,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ))
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Shop Name : ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(userList[index].shopName,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ))
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Shop Name : ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(userList[index].shopName,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ))
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Shop Ratings : ",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    RatingBar.builder(
                                      initialRating: double.parse(
                                          userList[index].ratings.toString()),
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      // itemPadding: const EdgeInsets.symmetric(
                                      //     horizontal: 4.0),
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      })
                ],
              ));
        });
  }
}
