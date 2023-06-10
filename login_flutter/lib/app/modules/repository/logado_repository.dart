import 'package:get/get.dart';
import 'package:login_flutter/app/shared/rest_client.dart';

class LogadoRepository extends GetConnect {
  final RestClient restClient;
  LogadoRepository(this.restClient);
}
