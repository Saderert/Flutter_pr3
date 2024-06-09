import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomeScreen(),
        '/search': (context) => ProductSearch(),
      },
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Домашняя страница'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Перейти к поиску'),
          onPressed: () {
            Navigator.pushNamed(context, '/search');
          },
        ),
      ),
    );
  }
}

class ProductSearch extends StatefulWidget {
  @override
  _ProductSearchState createState() => _ProductSearchState();
}

class _ProductSearchState extends State<ProductSearch> {
  final TextEditingController _controller = TextEditingController();
  final Map<String, int> _products = {
    'PlayStation5': Random().nextInt(100),
    'IPhone 15': Random().nextInt(100),
    'IPhone 15 Pro': Random().nextInt(100),
    'MacBook Air': Random().nextInt(100),
  };
  String _message = '';

  void _searchProduct() {
    setState(() {
      var product = _controller.text;
      if (_products.containsKey(product)) {
        var productAmount = _products[product];
        if (productAmount! > 0) {
          _message = '"$product" есть в наличии, количество: "$productAmount"';
        } else {
          _message = 'Такого продукта нет в нашем асортименте или он закончился';
        }
      } else {
        _message = 'Такого продукта нет в нашем асортименте или он закончился';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Поиск продукта'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Введите название продукта'),
            ),
            ElevatedButton(
              onPressed: _searchProduct,
              child: Text('Найти'),
            ),
            Text(_message),
          ],
        ),
      ),
    );
  }
}