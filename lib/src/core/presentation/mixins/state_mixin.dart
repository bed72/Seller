import 'package:flutter/cupertino.dart';

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void completeState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => completeState());
  }
}
