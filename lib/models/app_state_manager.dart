import 'dart:async';

import 'package:flutter/foundation.dart';

class FooderlichTab {
  static const explore = 0;
  static const recipes = 1;
  static const toBuy = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _initialised = false;
  bool _loggedIn = false;
  bool _onBoardingComplete = false;
  int _selectedTab = FooderlichTab.explore;

  bool get isInitialised => _initialised;
  bool get isLoggedIn => _loggedIn;
  bool get isOnboardingComplete => _onBoardingComplete;
  int get getSelectedTab => _selectedTab;

  void initialiseApp() {
    Timer(
        Duration(
          milliseconds: 2000,
        ), () {
      _initialised = true;
      notifyListeners();
    });
  }

  void login(String userName, String password) {
    _loggedIn = true;
    notifyListeners();
  }

  void completeOnboarding() {
    _onBoardingComplete = true;
    notifyListeners();
  }

  void gotoTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  void gotoRecipes() {
    _selectedTab = 1;
    notifyListeners();
  }

  void logout() {
    _loggedIn = false;
    _initialised = false;
    _onBoardingComplete = false;
    _selectedTab = 0;
    initialiseApp();
    notifyListeners();
  }
}
