import 'package:collection/collection.dart';
import 'package:dart_frog/dart_frog.dart';

import '../../constant/user.dart';
import '../../model/user.dart';

Response onRequest(RequestContext context, String id) {
  final parsedId = int.tryParse(id);
  if (parsedId == null) {
    return Response.json(statusCode: 400, body: {'message': 'Failed to retrieve user details'});
  }

  List<User> users = User.listFromJson(userList['data'] as List);
  User? user = users.firstWhereOrNull((element) => element.id == parsedId);

  bool found = user != null;

  if (found) {
    return Response.json(body: {'message': 'Successfully Retrieved', 'data': user.toJson()});
  } else {
    return Response(statusCode: 404, body: 'User not found with id $id');
  }
}
