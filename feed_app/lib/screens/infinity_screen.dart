import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InfinityScreen extends StatefulWidget {
  const InfinityScreen({super.key});

  @override
  State<InfinityScreen> createState() => _InfinityScreenState();
}

class _InfinityScreenState extends State<InfinityScreen> {
  List<String> items = [
    'item1',
    'item2',
    'item3',
    'item4',
    'item5',
    'item6',
    'item7',
    'item8',
    'item9',
    'item10',
    'item1',
    'item2',
    'item3',
    'item4',
    'item5',
    'item6',
    'item7',
    'item8',
    'item9',
    'item10',
  ];

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      // 스크롤 맨 밑
      // _controller.position.maxScrollExtent : 스크롤 위치의 최댓값
      // _controller.position.offset          : 현재 스크롤 위치
      print('현재 스크롤 : ${_controller.offset}');

      if (_controller.position.maxScrollExtent == _controller.offset) {
        // 데이터 요청 (다음 페이지)
        fetch();
      }
    });
  }

  Future fetch() async {
    print('fetch...');
    // http
    // 1. URL 인코딩
    // 2. GET 방식 요청
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        // items.addAll(['New']);

        // JSON 문자열 ➡ List<>
        final List newData = json.decode(response.body);
        items.addAll(newData.map<String>((item) {
          final id = item['id'];
          final title = item['title'];
          return 'Item $id - $title';
        }));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Inifinity Scroll'),
        ),
        body: ListView.builder(
          controller: _controller,
          padding: EdgeInsets.all(8),
          itemBuilder: (context, index) {
            // index: 0~19
            if (index < items.length) {
              final item = items[index];
              return ListTile(
                title: Text(item),
              );
            }
            // index: 20
            else {
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 40.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
          itemCount: items.length + 1, // ProgressIndicator(+1)
        ));
  }
}
