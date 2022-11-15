import 'package:flutter/material.dart';
import 'package:tst_flutter_221031/component/head.dart';

class FormDemo extends StatefulWidget {
  const FormDemo({Key? key}) : super(key: key);

  @override
  State<FormDemo> createState() => _FormDemoState();
}

class _FormDemoState extends State<FormDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Head('表单'),
      body: Container(),

    );
  }
}
