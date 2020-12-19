import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:FSOUNotes/app/locator.dart';
import 'package:FSOUNotes/app/router.gr.dart';
import 'package:FSOUNotes/models/user.dart';
import 'package:FSOUNotes/services/funtional_services/authentication_service.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:FSOUNotes/services/funtional_services/sharedpref_service.dart';

class ProfileViewModel extends BaseViewModel {
  DialogService _dialogService = locator<DialogService>();
  AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  NavigationService _navigationService = locator<NavigationService>();
  SharedPreferencesService _sharedPreferencesService =
      locator<SharedPreferencesService>();
  User _user;
  User get user => _user;
  String _userOption;

  String get userOption => _userOption;

  List<DropdownMenuItem<String>> _dropDownOfOpenPDF;
  List<DropdownMenuItem<String>> get dropDownOfOpenPDF => _dropDownOfOpenPDF;

  List<DropdownMenuItem<String>> buildAndGetDropDownMenuItems(List items) {
    List<DropdownMenuItem<String>> i = List();
    items.forEach((item) {
      i.add(DropdownMenuItem(value: item, child: Text(item)));
    });
    return i;
  }

  void changedDropDownItemOfOpenPdfChoice(String newChoice) async {
    _userOption = newChoice;
    SharedPreferences prefs = await _sharedPreferencesService.store();
    if (newChoice == "Ask me before opening pdf") {
      if (prefs.containsKey("openDocChoice")){
        prefs.remove("openDocChoice");
      }
    } else {
      prefs.setString("openDocChoice", newChoice);
    }
    Fluttertoast.showToast(msg: "Settings Saved !");
    notifyListeners();
  }

  setUser() async {
    setBusy(true);
    SharedPreferences prefs = await _sharedPreferencesService.store();
    if (prefs.containsKey("openDocChoice")) {
      _userOption = prefs.getString("openDocChoice");
    } else {
      _userOption = "Ask me before opening pdf";
    }
    List<String> items = [
      "Open In App",
      "Open In Browser",
      "Ask me before opening pdf"
    ];
    _dropDownOfOpenPDF = buildAndGetDropDownMenuItems(items);
    User user = User.fromData(
        json.decode(prefs.getString("current_user_is_logged_in")));
    _user = user;
    setBusy(false);
    notifyListeners();
  }

  handleSignOut(BuildContext context) async {
    // DialogResponse dialogResult = await _dialogService.showConfirmationDialog(
    //   title: "Change Profile Data",
    //   description:
    //       "In Order to change your data,you just need to sign-in again using your Gmail id",
    //   cancelTitle: "GO BACK",
    //   confirmationTitle: "PROCEED",
    // );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: Text(
                  "Are you sure?",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(fontSize: 20),
                  overflow: TextOverflow.clip,
                ),
              ),
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  child: Text(
                    "GO BACK",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: 15),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text(
                    "PROCEED",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(fontSize: 15),
                  ),
                  onPressed: () async {
                    Navigator.of(context).pop();
                    setBusy(true);
                    await _authenticationService.handleSignOut().then((value) {
                      if (value ?? true) {
                        _navigationService.navigateTo(Routes.introViewRoute);
                      } else
                        Fluttertoast.showToast(
                            msg: "Sign Out failed ,please try again later");
                    });
                    setBusy(false);
                    notifyListeners();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
    // if (dialogResult.confirmed) {}
  }
}
