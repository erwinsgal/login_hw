import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/images/background.jpg'),
    fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: const Text('News #1'),
                  subtitle: const Text('Here should be text of the news number 1'),
                  trailing: const SizedBox(
                    width: 40,
                    height: 40,
                    child: LikeButton(
                      size: 30,
                    ),
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  title: const Text('News #2'),
                  subtitle: const Text('Here should be text of the news number 2'),
                  trailing: const SizedBox(
                    width: 40,
                    height: 40,
                    child: LikeButton(
                      size: 30,
                    ),
                  ),
                ),
              ),Card(
                child: ListTile(
                  title: const Text('News #3'),
                  subtitle: const Text('Here should be text of the news number 3'),
                  trailing: const SizedBox(
                    width: 40,
                    height: 40,
                    child: LikeButton(
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}