import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:login_page_hw/model/profile.dart';
import '../resources/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileRepository _repository = ProfileRepository();
  ProfileBloc() : super(ProfileInitial()) {
    on<FetchedProfileEvent>(_repository.getProfileData);
  }
}
