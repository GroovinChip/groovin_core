import 'package:flutter/material.dart';

/// Creates an [IndexedStack] with children that animate in and out.
/// 
/// Source: https://gist.github.com/rodydavis/e83c58834892916915358c1fc18dd9a4
class AnimatedIndexedStack extends StatelessWidget {
  const AnimatedIndexedStack({
    Key key,
    @required this.index,
    @required this.children,
    @required this.duration,
  }) : super(key: key);

  final int index;
  final List<Widget> children;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      children: [
        for (var i = 0; i < children.length; i++)
          AnimatedOpacity(
            opacity: index == i ? 1.0 : 0.0,
            duration: duration,
            child: children[i],
          ),
      ],
    );
  }
}