import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/app/app_cubit/app_state.dart';
import 'package:task/core/utils/cahche_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  List<String> langs = [
    'English',
    'العربية',
  ];

  void changeLanguage(String langCode) async {
    await CacheHelper().saveData(key: 'lang', value: langCode);
    emit(state.copyWith(
        lang: langCode == 'en' ? 'English' : 'العربية', langCode: langCode));
  }
}
