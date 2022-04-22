import 'package:flutter/widgets.dart';

mixin StateMixin<T extends StatefulWidget> on State<T> {
  void setupState();
  void destroyState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => setupState());
  }

  @override
  void dispose() {
    destroyState();

    super.dispose();
  }
}
