import 'package:flutter/material.dart';

import '../../../core/resources/values_manager.dart';

Container dividerOrDivider() {
  return Container(
    margin: const EdgeInsets.all(AppMargin.m10),
    height: 45,
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
        Text(
          '  OR connect with ',
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
