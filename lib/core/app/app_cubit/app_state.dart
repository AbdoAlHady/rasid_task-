class AppState {
  final String lang;
  final String langCode;

  AppState({this.lang = 'English', this.langCode = 'en'});

  AppState copyWith({
    String? lang,
    String? langCode,
  }) {
    return AppState(
      lang: lang ?? this.lang,
      langCode: langCode ?? this.langCode,
    );
  }
}
