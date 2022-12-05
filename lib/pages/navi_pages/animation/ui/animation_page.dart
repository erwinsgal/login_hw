import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Lottie.asset('assets/animation/127305-like-a-boss-lolo.json'),
        const SizedBox(
          height: 20,
        ),
        Lottie.asset('assets/animation/6686-sun.json'),
        const SizedBox(
          height: 20,
        ),
        Lottie.asset('assets/animation/8837-puffy-rabbit.json'),
        const SizedBox(
          height: 20,
        ),
        Lottie.asset('assets/animation/86967-shiba-sad.json'),
        const SizedBox(
          height: 20,
        ),
        Lottie.asset('assets/animation/125660-turtle.json'),
        const SizedBox(
          height: 20,
        ),
        Lottie.asset('assets/animation/69371-penguin-gives-love.json')
      ]),
    );
  }
}
