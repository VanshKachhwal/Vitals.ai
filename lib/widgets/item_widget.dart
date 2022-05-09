import 'package:flutter/material.dart';

import '../models/test_results.dart';

class ItemWidget extends StatelessWidget {

  final Result result;
  const ItemWidget({required Key key, required this.result})
  :super(key:key);

  @override
  Widget build(BuildContext context) {
    return ListTile();
  }
}
