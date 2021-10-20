import 'package:flutter/material.dart';
import 'package:novus_trade_v1/main.dart';

class AnimatedFloatingButton extends StatelessWidget {
  final bool visible;
  final VoidCallback callback;
  final VoidCallback onLongPress;
  final Widget child;
  final Color backgroundColor;
  final Color foregroundColor;
  final String tooltip;
  final String heroTag;
  final double elevation;
  final ShapeBorder shape;
  final Curve curve;

  const AnimatedFloatingButton(
      {this.visible = true,
      this.callback,
      this.onLongPress,
      this.backgroundColor,
      this.child,
      this.foregroundColor,
      this.tooltip,
      this.heroTag,
      this.elevation = 6.0,
      this.shape = const CircleBorder(),
      this.curve = Curves.linear});

  @override
  Widget build(BuildContext context) {
    var margin = visible ? 0.0 : 28.0;

    return Container(
      child: Container(
        constraints: BoxConstraints(minHeight: 0.0, minWidth: 0.0),
        width: 60.0,
        height: 60.0,
        child: AnimatedContainer(
          curve: curve,
          margin: EdgeInsets.all(margin),
          duration: Duration(milliseconds: 150),
          width: visible ? 60.0 : 0.0,
          decoration: BoxDecoration(
            color: Colors.black,
            gradient: LinearGradient(colors: [
              Colors.blue,
              HexColor('#6A88E5'),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
            shape: BoxShape.circle,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.blue.withOpacity(0.4),
                  offset: const Offset(8.0, 16.0),
                  blurRadius: 16.0),
            ],
          ),
          height: visible ? 60.0 : 0.0,
          child: GestureDetector(
            onLongPress: onLongPress,
            child: FloatingActionButton(
              child: visible ? child : null,
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              onPressed: callback,
              tooltip: tooltip,
              heroTag: heroTag,
              elevation: elevation,
              highlightElevation: elevation,
              shape: shape,
            ),
          ),
        ),
      ),
    );
  }
}
