import 'package:notelife/domain/use_case/profile/change_profile_name.dart';
import 'package:notelife/domain/use_case/profile/get_profile_use_case.dart';

class ProfileUseCases {
  final ChangeProfileName changeProfileName;
  final GetProfileUseCase getProfileUseCase;

  ProfileUseCases({
    required this.changeProfileName,
    required this.getProfileUseCase,
  });
}
