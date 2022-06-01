import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/screens/details_page.dart';

void main() {
  runApp(const ProviderScope(
      child: MyApp())); //ProviderScope armazerna os estados dos providers
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Crypto Listing', home: DetailsPage());
  }
}
