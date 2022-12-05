import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_hw/services/shared_preference.dart';
import '../bloc/profile_bloc.dart';
import 'package:login_page_hw/model/profile.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late ProfileBloc profileBloc;
  Profile? profile;

  String? userName = sharedPreference.getUserName;

  @override
  void initState() {
    profileBloc = ProfileBloc();
    profileBloc.add(FetchedProfileEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder(
        bloc: profileBloc,
        builder: (context, state) {
          if (state is LoadingProfileState) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            );
          }
          if (state is LoadedProfileState) {
            profile = state.profile;
            return buildBody();
          }
          if (state is FailureProfileState) {
            return Center(
              child: Text("Error"),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget buildBody() {
    return Container(
      padding: EdgeInsets.only(top: 50, right: 20, left: 20),
      child: Column(
        children: [
          Text("${profile!.id}"),
          Text("${profile!.userId}"),
          Text(profile!.title),
          Text(profile!.body),
          Text(userName!),//from sharedPreferences
        ],
      ),
    );
  }
}
