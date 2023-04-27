import 'package:flutter/material.dart';
import 'package:flutter_example/features/UserList/presentation/bloc/bloc/user_list_bloc.dart';
import 'package:flutter_example/features/UserList/presentation/pages/user_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_example/features/UserList/user_list_injection.dart'
    as sl_user_list;

Future<void> main() async {
  await Future.wait([sl_user_list.init()]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello"),
      ),
      body: SafeArea(
        child: Column(
          children: const [
            Center(
              child: Text(
                "hello am there!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                          create: (context) => sl_user_list.sl<UserListBloc>()
                            ..add(GetUserList()),
                          child: UserList(),
                        )),
              );
            },
            child: const Text("UserList"),
          )),
    );
  }
}
