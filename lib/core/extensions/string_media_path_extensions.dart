import '../build_configs/build_config_manager.dart';

extension MediaPaths on String {
  String toProjectMediaPath() {
    String server = config.host;
    String folder = "mediacache";
    String size = "original";
    return "$server/$folder/$size/$this";
  }
}
