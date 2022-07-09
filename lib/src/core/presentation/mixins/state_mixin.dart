import 'package:flutter/cupertino.dart';

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void onCreated();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onCreated();
    });
  }
}
