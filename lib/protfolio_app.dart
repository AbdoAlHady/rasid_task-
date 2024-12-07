import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/app/app_cubit/app_cubit.dart';
import 'package:task/core/app/app_cubit/app_state.dart';
import 'package:task/core/utils/cahche_helper.dart';
import 'package:task/generated/l10n.dart';
import 'package:task/logic/pdf/pdf_generator_cubit.dart';
import 'package:task/views/screen/pdf_screen.dart';

class ProtfolioApp extends StatelessWidget {
  const ProtfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return BlocProvider(
          create: (context) => AppCubit()
            ..changeLanguage(CacheHelper().getData(key: 'lang') ?? 'en'),
          child: BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              return MaterialApp(
                locale: state.langCode == 'ar'
                    ? const Locale(
                        'ar',
                      )
                    : const Locale('en'),
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  fontFamily: state.langCode == 'ar' ? 'Cairo' : 'Poppins',
                  scaffoldBackgroundColor: Colors.white,
                ),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                home: BlocProvider(
                  create: (_) => PdfGeneratorCubit(),
                  child: const PdfScreen(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
