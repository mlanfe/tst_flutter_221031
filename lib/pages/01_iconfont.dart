import 'package:flutter/material.dart';
import '../asset/font/icons.dart';

class DemoIconFont extends StatelessWidget {
  const DemoIconFont({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('iconfont')),
      body: Column(children: [
        Row(children: [
          const Icon(MyIcons.book, color: Colors.red,),
          const Icon(MyIcons.shouTao, color: Colors.blue,),
          const Icon(MyIcons.viewList, color: Colors.orange,),
          const Icon(MyIcons.eat),
          const Text('\ue76d', style: TextStyle(fontFamily: 'iconfont', color: Colors.red, fontSize: 32 ),),
          const Text('====='),
          Text(String.fromCharCode(0xe76d), style: const TextStyle(fontFamily: 'iconfont', color: Colors.red, fontSize: 32 ),)
          ,],
        ),

      ],),
    );
  }
}
