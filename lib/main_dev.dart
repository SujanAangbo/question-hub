import 'package:question_hub/flavor_config.dart';
import 'package:question_hub/main_common.dart';

void main() {
  FlavorConfig config = FlavorConfig(flavor: Flavor.dev);
  mainCommon(config);
}
