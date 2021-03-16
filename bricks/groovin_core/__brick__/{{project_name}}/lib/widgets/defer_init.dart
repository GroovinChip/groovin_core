import 'dart:math' show Random;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show RendererBinding;

/// Defines a generic asynchronous function that returns a Widget
typedef DeferInitCreate<T extends Widget> = Future<T> Function();

/// Ensures that asynchronous code will be run to completion before a widget is built.
/// 
/// Source: https://gist.github.com/slightfoot/85d39f7c235119b724b6b1fa4afa0b41
@immutable
class DeferInit<T extends Widget> extends StatefulWidget {
  const DeferInit({
    Key key,
    @required this.onDefer,
    this.emptyWidget = const SizedBox.shrink(),
  }) : super(key: key);

  final DeferInitCreate<T> onDefer;
  final Widget emptyWidget;

  @override
  _DeferInitState<T> createState() => _DeferInitState<T>();
}

class _DeferInitState<T extends Widget> extends State<DeferInit<T>> {
  Future<T> _future;

  @override
  void initState() {
    super.initState();
    RendererBinding.instance.deferFirstFrame();
    _future = widget.onDefer().whenComplete(() {
      RendererBinding.instance.allowFirstFrame();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _future,
      builder: (BuildContext context, AsyncSnapshot<T> snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const SizedBox.shrink();
        } else if (snapshot.hasError) {
          return ErrorWidget(snapshot.error);
        } else {
          return snapshot.data ?? widget.emptyWidget;
        }
      },
    );
  }
}