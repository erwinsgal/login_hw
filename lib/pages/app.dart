import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_hw/bloc/app_bloc.dart';
import 'package:login_page_hw/pages/language_page.dart';
import 'package:login_page_hw/pages/register_page.dart';
import 'package:login_page_hw/pages/navbar.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppBloc appBloc;

  @override
  void initState() {
    appBloc = AppBloc();
    appBloc.add(LocaleInitAppEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>(
      create: (BuildContext context) => AppBloc(),
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocConsumer(
          bloc: appBloc,
          builder: (context, state) {
            if (state is UnAuthAppState) return RegisterPage();
            if (state is LocaleInitAppState) return LanguagePage();
            if (state is AuthAppState) return MainPage();
            return Container();
          },
          listener: (context, state) {
            if (state is LoadingAppState) buildLoading();
          },
        ),
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(
        color: Colors.red,
      ),
    );
  }
}
