import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/compensation_controller.dart';

class CompensationView extends GetView<CompensationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompensationView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CompensationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
