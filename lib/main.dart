import 'dart:convert';

import 'package:api_practice/api_provider/api_provider.dart';
import 'package:api_practice/models/product_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Practice',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyHomePage(title: 'API Practice'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ProductModel> mProductModel = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    var response =
        await ApiProvider().getMethod('https://fakestoreapi.com/products');
    mProductModel = List<ProductModel>.from(
        jsonDecode(response).map((model) => ProductModel.fromJson(model)));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) {
            ProductModel item = mProductModel[index];
            return Row(
              children: [
                Image.network(
                  item.image!,
                  height: 100,
                  width: 100,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        item.title!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(item.description!),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          item.price!.toString(),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          },
          itemCount: mProductModel.length),
    );
  }
}
