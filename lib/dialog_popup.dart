import 'package:flutter/material.dart';

class DialogPopup extends StatefulWidget {
  final Widget content;

  const DialogPopup({@required this.content, Key key}) : super(key: key);

  @override
  _DialogPopupState createState() => _DialogPopupState();
}

class _DialogPopupState extends State<DialogPopup> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ScaleTransition(
          scale: _animation,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: AlertDialog(
                scrollable: true,
                content: widget.content,
                titlePadding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                insetPadding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                contentPadding: EdgeInsets.all(20),
                backgroundColor: Colors.cyan,
              ),
            ),
          ),
        ),
      ],
    );
  }
}