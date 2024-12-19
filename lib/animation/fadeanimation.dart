// Packages you must install ==>  simple_animations: ^4.0.1 || supercharged: ^2.1.1


  // ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';

enum AniProps { opacity, translateY }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation({required this.delay, required  this.child});

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween('opacity', Tween(begin: 0.0, end: 1.0),
          duration: const Duration(milliseconds: 500))
      ..tween('translateY', Tween(begin: -30.0, end: 0.0),
          duration: const Duration(milliseconds: 500), curve: Curves.easeOut);

    return CustomAnimationBuilder(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, Movie movie, child) => Opacity(
        opacity: movie.get('opacity'),
        child: Transform.translate(
            offset: Offset(0, movie.get('translateY')), child: child),
      ),
    );
  }
}