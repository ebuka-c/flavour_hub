import 'package:get/get.dart';

import '../controllers/auth_controller.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    // Major
    Get.put(AuthController(), permanent: true);
  }
}
