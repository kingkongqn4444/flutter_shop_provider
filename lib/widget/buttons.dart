import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

enum AppButtonType {
  Primary,
  PrimaryLeft,
  PrimaryRight,
  PrimaryOutline,
  Success,
  SuccessOutline,
  Danger,
  DangerOutline,
}

/// A widget for buttons
class AppButton extends StatefulWidget {
  final AppButtonType type;
  final String text;
  final Function onPressed;
  final bool disabled;
  final bool buttonTop;
  final bool buttonMiddle;
  final bool placeholder;

  AppButton(
      {this.type,
      this.text,
      this.onPressed,
      this.disabled = false,
      this.buttonTop = false,
      this.placeholder = false,
      this.buttonMiddle = false});

  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Opacity(
      opacity: widget.disabled ? 0.4 : 1.0,
      child: Container(
        margin: widget.buttonTop
            ? EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0)
            : widget.buttonMiddle
                ? EdgeInsetsDirectional.fromSTEB(20, 16, 20, 0)
                : EdgeInsetsDirectional.fromSTEB(
                    widget.type == AppButtonType.PrimaryRight ? 10 : 20,
                    16,
                    widget.type == AppButtonType.PrimaryLeft ? 10 : 20,
                    (MediaQuery.of(context).padding.bottom) +
                        (24 - (MediaQuery.of(context).padding.bottom) / 2),
                  ),
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: (widget.type == AppButtonType.Primary ||
                  widget.type == AppButtonType.PrimaryOutline ||
                  widget.type == AppButtonType.PrimaryLeft ||
                  widget.type == AppButtonType.PrimaryRight)
              ? LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [0.0, 1],
                  colors: [Colors.red, Colors.yellow],
                )
              : (widget.type == AppButtonType.Danger ||
                      widget.type == AppButtonType.DangerOutline ||
                      widget.type == AppButtonType.Success ||
                      widget.type == AppButtonType.SuccessOutline)
                  ? null
                  : LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      stops: [0.0, 1],
                      colors: [Colors.red, Colors.yellow],
                    ), // Success color placeholder
          color: (widget.type == AppButtonType.Danger ||
                  widget.type == AppButtonType.DangerOutline)
              ? Colors.red
              : widget.type == AppButtonType.Success ||
                      widget.type == AppButtonType.SuccessOutline
                  ? Colors.blue
                  : null,
          boxShadow: [
            widget.type == AppButtonType.Primary ||
                    widget.type == AppButtonType.PrimaryLeft ||
                    widget.type == AppButtonType.PrimaryRight
                ? BoxShadow(
                    color: Colors.orange.withOpacity(0.1),
                    offset: Offset(0, 8),
                    blurRadius: 16,
                    spreadRadius: -4.0)
                : widget.type == AppButtonType.PrimaryOutline
                    ? BoxShadow(
                        color: Colors.orange.withOpacity(0.05),
                        offset: Offset(0, 8),
                        blurRadius: 16,
                        spreadRadius: -4.0)
                    : widget.type == AppButtonType.Success
                        ? BoxShadow(
                            color: Colors.blue.withOpacity(0.1),
                            offset: Offset(0, 8),
                            blurRadius: 16,
                            spreadRadius: -4.0)
                        : widget.type == AppButtonType.SuccessOutline
                            ? BoxShadow(
                                color: Colors.blue.withOpacity(0.05),
                                offset: Offset(0, 8),
                                blurRadius: 16,
                                spreadRadius: -4.0)
                            : widget.type == AppButtonType.Danger
                                ? BoxShadow(
                                    color: Colors.red.withOpacity(0.1),
                                    offset: Offset(0, 8),
                                    blurRadius: 16,
                                    spreadRadius: -4.0)
                                : BoxShadow(
                                    color: Colors.red.withOpacity(0.05),
                                    offset: Offset(0, 8),
                                    blurRadius: 16,
                                    spreadRadius: -4.0),
          ],
        ),
        child: widget.type == AppButtonType.Primary ||
                widget.type == AppButtonType.PrimaryLeft ||
                widget.type == AppButtonType.PrimaryRight ||
                widget.type == AppButtonType.Success ||
                widget.type == AppButtonType.Danger
            // Primary Button
            ? FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: !widget.placeholder
                    ? AutoSizeText(widget.text,
                        textAlign: TextAlign.center,
                        maxLines: widget.type == AppButtonType.Danger ? 2 : 1,
                        stepGranularity: 0.1,
                        style: widget.type == AppButtonType.Danger
                            ? TextStyle(
                                fontFamily: "Metropolis",
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                height: 1.3,
                              )
                            : TextStyle(
                                fontFamily: "Metropolis",
                                color: Colors.yellow,
                                fontSize: 18,
                                fontWeight: FontWeight.w700))
                    // Placeholder button rectangle
                    : Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.75),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: AutoSizeText(
                          widget.text,
                          textAlign: TextAlign.center,
                          maxLines: widget.type == AppButtonType.Danger ? 2 : 1,
                          stepGranularity: 0.1,
                          style: widget.type == AppButtonType.Danger
                              ? TextStyle(
                                  fontFamily: "Metropolis",
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  height: 1.3,
                                )
                              : TextStyle(
                                  fontFamily: "Metropolis",
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700),
                        ),
                      ),
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.white.withOpacity(0.15),
                onPressed: () {
                  if (widget.onPressed != null && !widget.disabled) {
                    widget.onPressed();
                  }
                  return;
                },
              )
            // Primary Outlined Button
            : Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(2),
                    height: 46,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                  ),
                  Container(
                    height: 50,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.transparent,
                    ),
                    child: FlatButton(
                      child: AutoSizeText(
                        widget.text,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        stepGranularity: 0.1,
                        style: widget.type == AppButtonType.DangerOutline
                            ? TextStyle(
                                fontFamily: "Metropolis",
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                height: 1.3,
                              )
                            : widget.type == AppButtonType.SuccessOutline
                                ? TextStyle(
                                    fontFamily: "Metropolis",
                                    color: Colors.green,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)
                                : TextStyle(
                                    fontFamily: "Metropolis",
                                    color: Colors.orange,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700),
                      ),
                      color: Colors.transparent,
                      splashColor: widget.type == AppButtonType.SuccessOutline
                          ? Color(0xFF00C5C3).withOpacity(0.3)
                          : widget.type == AppButtonType.DangerOutline
                              ? Colors.red.withOpacity(0.3)
                              : Color(0xFF00C5C3).withOpacity(0.3),
                      highlightColor:
                          widget.type == AppButtonType.SuccessOutline
                              ? Colors.teal.withOpacity(0.15)
                              : widget.type == AppButtonType.DangerOutline
                                  ? Colors.red.withOpacity(0.3)
                                  : Color(0xFF00C5C3).withOpacity(0.15),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      onPressed: () {
                        if (widget.onPressed != null && !widget.disabled) {
                          widget.onPressed();
                        }
                        return;
                      },
                    ),
                  ),
                ],
              ),
      ),
    ));
  }
}
