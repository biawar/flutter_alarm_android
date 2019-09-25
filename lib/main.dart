// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:android_intent/android_intent.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
// import 'package:platform/platform.dart';
// import 'package:meta/meta.dart';

void printMessage(String msg) => print('[${DateTime.now()}] $msg');

void printPeriodic() async {
  FlutterRingtonePlayer.play(
    android: AndroidSounds.alarm,
    ios: IosSounds.glass,
    looping: true,
    volume: 0.1,
  );

  final AndroidIntent intent = const AndroidIntent(
      //action: "action_application_details_settings",
       action: "action_view",
      //data: 'package:be.tramckrijte.workmanager_example');
      data: 'poc://deeplink.flutter.development');

  intent.launch();
} 
void printOneShot() => printMessage("One shot!");

Future<void> main() async {
  final int periodicID = 0;
  final int oneShotID = 1;

  // Start the AlarmManager service.
  await AndroidAlarmManager.initialize();

  printMessage("main run");
  runApp(const Center(child:Text('Teste do alarme!', textDirection: TextDirection.ltr)));      
  await AndroidAlarmManager.periodic(
      const Duration(seconds: 5), periodicID, printPeriodic,
      wakeup: true);
  await AndroidAlarmManager.oneShot(
      const Duration(seconds: 5), oneShotID, printOneShot);
}
