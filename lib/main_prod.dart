import 'package:question_hub/flavor_config.dart';

import 'main_common.dart';

void main() {
  FlavorConfig config = FlavorConfig(flavor: Flavor.prod);
  mainCommon(config);
}
