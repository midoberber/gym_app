import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

@immutable
abstract class Repository {
  http.Client get server => new http.Client();
}
