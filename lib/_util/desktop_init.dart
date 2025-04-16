import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

Future<void> initDesktop() async {
  if (!Platform.isAndroid && !Platform.isIOS) {
    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(
      minimumSize: Size(400, 700),
      maximumSize: Size(400, 700),
      size: Size(400, 700),
      title: "Lista de Tarefas",
    );

    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
}
