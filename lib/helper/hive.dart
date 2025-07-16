import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveHelper {
  static late Box _box;
  static Future<void> initializeHive() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.defaultDirectory = dir.path;
    _box = Hive.box();
  }

  static bool get showOnboard => _box.get('showOnboard', defaultValue: true);

  static set showOnboard(bool value) => _box.put('showOnboard', value);
}
