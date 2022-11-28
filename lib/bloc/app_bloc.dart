import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:login_page_hw/resources/app_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final _repository = AppRepository();
  AppBloc() : super(AppInitial()) {
    on<LocaleInitAppEvent>(_repository.onLocaleInitAppEvent);
    on<AppStartedEvent>(_repository.onAppStartedEvent);
    on<UserAuthedAppEvent>(_repository.onUserAuthedAppEvent);
  }
}
