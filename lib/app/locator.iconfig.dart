// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:FSOUNotes/AppTheme/AppStateNotifier.dart';
import 'package:FSOUNotes/services/funtional_services/authentication_service.dart';
import 'package:FSOUNotes/services/funtional_services/cloud_storage_service.dart';
import 'package:FSOUNotes/services/funtional_services/db_service.dart';
import 'package:FSOUNotes/services/funtional_services/third_party_services_module.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:FSOUNotes/services/state_services/download_service.dart';
import 'package:FSOUNotes/utils/file_picker_service.dart';
import 'package:FSOUNotes/services/funtional_services/firestore_service.dart';
import 'package:FSOUNotes/services/state_services/links_service.dart';
import 'package:FSOUNotes/services/state_services/notes_service.dart';
import 'package:FSOUNotes/utils/permission_handler.dart';
import 'package:FSOUNotes/services/state_services/question_paper_service.dart';
import 'package:FSOUNotes/services/state_services/report_service.dart';
import 'package:FSOUNotes/services/funtional_services/sharedpref_service.dart';
import 'package:FSOUNotes/services/state_services/subjects_service.dart';
import 'package:FSOUNotes/services/state_services/syllabus_service.dart';
import 'package:FSOUNotes/services/state_services/vote_service.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final thirdPartyServicesModule = _$ThirdPartyServicesModule();
  g.registerLazySingleton<AppStateNotifier>(() => AppStateNotifier());
  g.registerLazySingleton<AuthenticationService>(() => AuthenticationService());
  g.registerLazySingleton<CloudStorageService>(() => CloudStorageService());
  g.registerLazySingleton<DBService>(() => DBService());
  g.registerLazySingleton<DialogService>(
      () => thirdPartyServicesModule.dialogService);
  g.registerLazySingleton<DownloadService>(() => DownloadService());
  g.registerLazySingleton<FilePickerService>(() => FilePickerService());
  g.registerLazySingleton<FirestoreService>(() => FirestoreService());
  g.registerLazySingleton<LinksService>(() => LinksService());
  g.registerLazySingleton<NavigationService>(
      () => thirdPartyServicesModule.navigationService);
  g.registerLazySingleton<NotesService>(() => NotesService());
  g.registerLazySingleton<PermissionHandler>(() => PermissionHandler());
  g.registerLazySingleton<QuestionPaperService>(() => QuestionPaperService());
  g.registerLazySingleton<ReportsService>(() => ReportsService());
  g.registerLazySingleton<SharedPreferencesService>(
      () => SharedPreferencesService());
  g.registerLazySingleton<SnackbarService>(
      () => thirdPartyServicesModule.snackbarService);
  g.registerLazySingleton<SubjectsService>(() => SubjectsService());
  g.registerLazySingleton<SyllabusService>(() => SyllabusService());
  g.registerLazySingleton<VoteServie>(() => VoteServie());
}

class _$ThirdPartyServicesModule extends ThirdPartyServicesModule {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackbarService => SnackbarService();
}
