import 'package:flutter/material.dart';

class MarqueeText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final double duration; // Duration for one full scroll

  const MarqueeText({
    Key? key,
    required this.text,
    required this.style,
    this.duration = 10.0,
  }) : super(key: key);

  @override
  _MarqueeTextState createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late double _textWidth;
  late double _containerWidth;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: widget.duration.toInt()),
      vsync: this,
    )..repeat();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final textWidth = _getTextWidth(widget.text, widget.style);
      setState(() {
        _textWidth = textWidth;
        _containerWidth = MediaQuery.of(context).size.width;
        _animation = Tween<double>(
          begin: 0.0,
          end: _textWidth + _containerWidth,
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.linear,
        ));
      });
    });
  }

  double _getTextWidth(String text, TextStyle style) {
    final textSpan = TextSpan(text: text, style: style);
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size.width;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return ClipRect(
          child: Align(
            alignment: Alignment.centerLeft,
            widthFactor: _containerWidth / (_textWidth + _containerWidth),
            child: Transform.translate(
              offset: Offset(-_animation.value, 0),
              child: Text(
                widget.text,
                style: widget.style,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
