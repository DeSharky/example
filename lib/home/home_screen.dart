import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Add currencies',
        child: const Icon(Icons.add),
      ),
    );
  }

}