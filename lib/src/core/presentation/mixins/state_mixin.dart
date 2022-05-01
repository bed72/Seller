import 'package:flutter/cupertino.dart';

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void onCreated();
  void navigateTo(String? path);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      onCreated();
      navigateTo(null);
    });
  }
}
