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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(itemBuilder: (context, index) {
          /*ProductModel item = mProductModel[index];*/
          return Row(
            children: [
              Image.network(
                "https://blogger.googleusercontent.com/img/a/AVvXsEj3QuTZS9GDUmW8x5PIhoBEBFGwOoq_B_N6DqaqA46m3458WZti_XpROAMuZtX4Dm772GtZ6-Y3-9jZSgqgwdmURlNLP0PMSynGpQ3uGfvz-zrEbXF2KYd4TQsMhqd-QM807v1A1gSx8Rr8tqYF7AJD297pGjEc5m3yoM60d-CDd9fMIbX-ooBccIXMAQ",
                height: 100,
                width: 100,
              ),
              Column(
                children: const [
                  Text('Title'),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Description'),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )
            ],
          );
        }));
  }
}
