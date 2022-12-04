import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Lottie.asset('assets/animation/127305-like-a-boss-lolo.json')
    );
  }
}
