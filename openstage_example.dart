void main() {
  Uri deeplink = Uri.parse('flutter://community/board/view?id=3043');

  print('scheme: ${deeplink.scheme}');
  print('host: ${deeplink.host}');
  print('pathSegments: ${deeplink.pathSegments}');
  print('queryParametersAll: ${deeplink.queryParameters}');
  print('');
  
  switch (deeplink.host) {
    case 'community':
      _moveCommunity(deeplink.pathSegments, deeplink.queryParameters);
      break;
    case 'shopping':
      // NOTE: Do something this.
      break;
    default:
      print('Handled Exception');
  }
}

void _moveCommunity(List<String> paths, Map<String, dynamic> params) {
  switch (paths.first) {
    case 'board':
      _defaultAction(
        paths[1],
        params,
        doView: (id) {
          print('Do board view ${id}');
        },
        doCreate: (id) {
          print('Do board Create ${id}');
        },
      );
      break;
    case 'event':
      _defaultAction(
        paths[1],
        params,
        doView: (id) {
          print('Do event view ${id}');
        },
        doCreate: (id) {
          print('Do event create ${id}');
        },
      );
  }
}

void _defaultAction(
  String path,
  Map<String, dynamic> params, {
  required Function(int) doView,
  required Function(int) doCreate,
}) {
  switch (path) {
    case 'view':
      doView(_getId(params));
      break;
    case 'write':
      doCreate(_getId(params));
      break;
  }
}

int _getId(Map<String, dynamic> params) {
  try {
    return int.parse(params['id'] ?? '0');
  } catch (e) {
    return 0;
  }
}
