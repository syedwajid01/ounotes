import 'package:FSOUNotes/AppTheme/AppStateNotifier.dart';
import 'package:FSOUNotes/services/funtional_services/admob_service.dart';
import 'package:FSOUNotes/services/funtional_services/analytics_service.dart';
import 'package:FSOUNotes/services/funtional_services/app_info_service.dart';
import 'package:FSOUNotes/services/funtional_services/authentication_service.dart';
import 'package:FSOUNotes/services/funtional_services/cloud_storage_service.dart';
import 'package:FSOUNotes/services/funtional_services/crashlytics_service.dart';
import 'package:FSOUNotes/services/funtional_services/db_service.dart';
import 'package:FSOUNotes/services/funtional_services/firebase_firestore/firestore_service.dart';
import 'package:FSOUNotes/services/funtional_services/google_drive_service.dart';
import 'package:FSOUNotes/services/funtional_services/google_in_app_payment_service.dart';
import 'package:FSOUNotes/services/funtional_services/in_app_payment_service.dart';
import 'package:FSOUNotes/services/funtional_services/notification_service.dart';
import 'package:FSOUNotes/services/funtional_services/push_notification_service.dart';
import 'package:FSOUNotes/services/funtional_services/remote_config_service.dart';
import 'package:FSOUNotes/services/funtional_services/sharedpref_service.dart';
import 'package:FSOUNotes/services/state_services/download_service.dart';
import 'package:FSOUNotes/services/state_services/links_service.dart';
import 'package:FSOUNotes/services/state_services/notes_service.dart';
import 'package:FSOUNotes/services/state_services/question_paper_service.dart';
import 'package:FSOUNotes/services/state_services/report_service.dart';
import 'package:FSOUNotes/services/state_services/subjects_service.dart';
import 'package:FSOUNotes/services/state_services/syllabus_service.dart';
import 'package:FSOUNotes/services/state_services/vote_service.dart';
import 'package:FSOUNotes/ui/views/FilterDocuments/FD_DocumentDisplay/fd_documentview.dart';
import 'package:FSOUNotes/ui/views/FilterDocuments/FD_InputScreen/fd_inputView.dart';
import 'package:FSOUNotes/ui/views/FilterDocuments/FD_subjectdisplay/fd_subjectview.dart';
import 'package:FSOUNotes/ui/views/Settings/settings_view.dart';
import 'package:FSOUNotes/ui/views/about_us/about_us_view.dart';
import 'package:FSOUNotes/ui/views/about_us/privacy_policy/privacy_policyview.dart';
import 'package:FSOUNotes/ui/views/about_us/privacy_policy/terms_and_conditionview.dart';
import 'package:FSOUNotes/ui/views/admin/admin_view.dart';
import 'package:FSOUNotes/ui/views/admin/upload_log/upload_log_detail/upload_log_detail_view.dart';
import 'package:FSOUNotes/ui/views/admin/upload_log/upload_log_detail/upload_log_edit/upload_log_edit_view.dart';
import 'package:FSOUNotes/ui/views/admin/upload_log/upload_log_view.dart';
import 'package:FSOUNotes/ui/views/all_documents/all_documents_view.dart';
import 'package:FSOUNotes/ui/views/downloads/Downloads_view.dart';
import 'package:FSOUNotes/ui/views/edit/edit_view.dart';
import 'package:FSOUNotes/ui/views/home/home_view.dart';
import 'package:FSOUNotes/ui/views/intro/intro_view.dart';
import 'package:FSOUNotes/ui/views/links/links_view.dart';
import 'package:FSOUNotes/ui/views/notes/notes_view.dart';
import 'package:FSOUNotes/ui/views/pdf/pdf_view.dart';
import 'package:FSOUNotes/ui/views/question_papers/question_papers_view.dart';
import 'package:FSOUNotes/ui/views/splash/spash_view.dart';
import 'package:FSOUNotes/ui/views/syllabus/syllabus_view.dart';
import 'package:FSOUNotes/ui/views/upload/upload_selection/upload_selection_view.dart';
import 'package:FSOUNotes/ui/views/upload/upload_view.dart';
import 'package:FSOUNotes/ui/views/web_view/web_view.dart';
import 'package:FSOUNotes/ui/widgets/smart_widgets/thank_you_page/thank_you_view.dart';
import 'package:FSOUNotes/ui/widgets/smart_widgets/thank_you_page/upload_thank_you/thank_you_for_uploading.dart';
import 'package:FSOUNotes/ui/widgets/smart_widgets/watch_ad/watch_ad_view.dart';
import 'package:FSOUNotes/ui/widgets/smart_widgets/why_to_pay_for_download_page/why_to_pay_for_download.dart';
import 'package:FSOUNotes/utils/file_picker_service.dart';
import 'package:FSOUNotes/utils/permission_handler.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(logger: StackedLogger(), routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: IntroView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: AllDocumentsView),
  MaterialRoute(page: PDFScreen),
  MaterialRoute(page: NotesView),
  MaterialRoute(page: QuestionPapersView),
  MaterialRoute(page: SyllabusView),
  MaterialRoute(page: LinksView),
  MaterialRoute(page: AboutUsView),
  MaterialRoute(page: SettingsView),
  MaterialRoute(page: UploadView),
  MaterialRoute(page: UploadSelectionView),
  MaterialRoute(page: DownLoadView),
  MaterialRoute(page: FDInputView),
  MaterialRoute(page: FDSubjectView),
  MaterialRoute(page: FDDocumentView),
  MaterialRoute(page: PrivacyPolicyView),
  MaterialRoute(page: TermsAndConditionView),
  MaterialRoute(page: AdminView),
  MaterialRoute(page: WebViewWidget),
  MaterialRoute(page: EditView),
  MaterialRoute(page: UploadLogView),
  MaterialRoute(page: UploadLogDetailView),
  MaterialRoute(page: UploadLogEditView),
  MaterialRoute(page: WatchAdToContinueView),
  MaterialRoute(page: ThankYouView),
  MaterialRoute(page: ThankYouForUploadingView),
  MaterialRoute(page: WhyToPayForDownloadView),
], dependencies: [
  LazySingleton(classType: BottomSheetService),
  // LazySingleton(classType: DialogService),
  // LazySingleton(classType: NavigationService),
  // LazySingleton(classType: SnackbarService),
  LazySingleton(classType: AdmobService),
  LazySingleton(classType: AnalyticsService),
  LazySingleton(classType: AppInfoService),
  LazySingleton(classType: AppStateNotifier),
  LazySingleton(classType: AuthenticationService),
  // LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: CloudStorageService),
  LazySingleton(classType: CrashlyticsService),
  LazySingleton(classType: DBService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: DownloadService),
  LazySingleton(classType: FilePickerService),
  LazySingleton(classType: FirestoreService),
  LazySingleton(classType: GoogleDriveService),
  LazySingleton(classType: GoogleInAppPaymentService),
  LazySingleton(classType: InAppPaymentService),
  LazySingleton(classType: LinksService),
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: NotesService),
  LazySingleton(classType: NotificationService),
  LazySingleton(classType: PermissionHandler),
  LazySingleton(classType: PushNotificationService),
  LazySingleton(classType: QuestionPaperService),
  LazySingleton(classType: RemoteConfigService),
  LazySingleton(classType: ReportsService),
  LazySingleton(classType: SharedPreferencesService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: SubjectsService),
  LazySingleton(classType: SyllabusService),
  LazySingleton(classType: VoteService),
])
class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}
