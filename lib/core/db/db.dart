import 'package:hive_flutter/hive_flutter.dart';

import '../models/broken.dart';
import '../utils.dart';

class DB {
  static String boxName = 'myboxbroken';
  static String keyName = 'brokensList';
  static List<Broken> brokensList = [];
}

Future<void> initHive() async {
  try {
    await Hive.initFlutter();
    // await Hive.deleteBoxFromDisk(DB.boxName);
    Hive.registerAdapter(BrokenAdapter());
    Hive.registerAdapter(ExpenseAdapter());
  } catch (e) {
    logger(e);
  }
}

Future<void> getModels() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    List data = box.get(DB.keyName) ?? [];
    DB.brokensList = data.cast<Broken>();
    logger(DB.brokensList.length);
  } catch (e) {
    logger(e);
  }
}

Future<void> updateModels() async {
  try {
    final box = await Hive.openBox(DB.boxName);
    box.put(DB.keyName, DB.brokensList);
    DB.brokensList = await box.get(DB.keyName);
  } catch (e) {
    logger(e);
  }
}
