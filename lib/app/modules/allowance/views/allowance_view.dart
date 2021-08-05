import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/allowance_controller.dart';

class AllowanceView extends GetView<AllowanceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AllowanceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AllowanceView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
