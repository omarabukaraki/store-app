import 'package:flutter/material.dart';

void main() {
  runApp(StoreApp());
}

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: ElevatedButton(
            onPressed: () async {
              // http.Response response = await http
              //     .post(Uri.parse('https://fakestoreapi.com/products'), body: {
              //   'title': 'dest product',
              //   'price': '13.5',
              //   'description': 'lorem ipsum set',
              //   'image': ' https://i.pravatar.cc',
              //   'category': 'electronic'
              // }, headers: {
              //   'Accept': 'application/json',
              //   'Content-Type': 'application/x-www-form-urlencoded'
              // });
            },
            child: Icon(Icons.request_page)),
      )),
    );
  }
}
