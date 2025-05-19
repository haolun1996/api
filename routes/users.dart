import 'package:dart_frog/dart_frog.dart';

import '../constant/user.dart';

Response onRequest(RequestContext context) {
  return Response.json(body: userList);
}
