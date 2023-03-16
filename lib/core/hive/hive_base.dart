
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveBase {
  late final Box _apiBox;

  Future<void> init() async{
    final dir = await getApplicationDocumentsDirectory();
    Hive.init("${dir.path}hive");
    _apiBox = await Hive.openBox('apiBox');
  }

  Box get apiBox => _apiBox;
}