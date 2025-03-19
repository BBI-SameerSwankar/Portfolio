import 'package:flutter/material.dart';

class Window {
  final String title;
  final Widget child;
  bool isMinimized;
  bool isActive;

  Window({
    required this.title,
    required this.child,
    this.isMinimized = false,
    this.isActive = false,
  });
}

class WindowManager extends ChangeNotifier {
  final List<Window> _windows = [];
  Window? _activeWindow;

  List<Window> get windows => _windows;
  Window? get activeWindow => _activeWindow;

  void openWindow(String title, Widget child) {
    var existingWindow = _windows.firstWhere(
      (w) => w.title == title,
      orElse: () => Window(title: '', child: Container()),
    );

    if (existingWindow.title == '') {
      Window newWindow = Window(title: title, child: child, isActive: true);
      _windows.add(newWindow);
      setActiveWindow(newWindow);
    } else {
      setActiveWindow(existingWindow);
    }

    notifyListeners();
  }

  void minimizeWindow(Window window) {
    window.isMinimized = true;
    _activeWindow = null;
    notifyListeners();
  }

  void restoreWindow(Window window) {
    window.isMinimized = false;
    setActiveWindow(window);
    notifyListeners();
  }

  void closeWindow(Window window) {
    _windows.remove(window);
    if (_windows.isNotEmpty) {
      setActiveWindow(_windows.last);
    } else {
      _activeWindow = null;
    }
    notifyListeners();
  }

  void setActiveWindow(Window window) {
    _activeWindow = window;
    notifyListeners();
  }
}
