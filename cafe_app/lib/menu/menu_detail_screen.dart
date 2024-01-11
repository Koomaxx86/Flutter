import 'package:flutter/material.dart';

class MenuDetailScreen extends StatefulWidget {
  const MenuDetailScreen({super.key});

  @override
  State<MenuDetailScreen> createState() => _MenuDetailScreenState();
}

class _MenuDetailScreenState extends State<MenuDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("커피"),
        centerTitle: true,
        backgroundColor: Colors.black12,
        leading: BackButton(
          color: Colors.grey,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.home,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
