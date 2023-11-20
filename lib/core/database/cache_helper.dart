import 'package:get_storage/get_storage.dart';

class CacheHelper {
  GetStorage box = GetStorage();
  init() async {
    GetStorage.init();
  }

  getData({required String key}) {
    return box.read(key);
  }

  saveData({required String key, required dynamic value}) {
    box.write(key, value);
  }
}
