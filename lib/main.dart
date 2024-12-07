import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/app_bloc_observer.dart';
import 'package:task/core/services/pdf_service/pdf_generator_service.dart';
import 'package:task/core/services/pdf_service/pdf_header_section.dart';
import 'package:task/core/utils/cahche_helper.dart';
import 'package:task/protfolio_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PdfHeaderSection.loadSvgs();
  await PdfGeneratorService.loadFont();
  await CacheHelper().init();
  Bloc.observer = AppBlocObserver();
  runApp(const ProtfolioApp());
}


// flutter pub run intl_utils:generate