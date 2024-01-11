class ApiConfig {
  static const String BASE_URL = "http://34.126.163.62/api";

  static const Map<String, String> RESOURCES = {
    'auth': 'auth',
    'birds': 'birds',
    'histories': 'histories',
    'prediction': 'prediction',
    'orders': 'orders',
    'family': 'family',
    'status': 'status'
  };

  static dynamic ENDPOINT = {
    'auth': {
      'login': '$BASE_URL/${RESOURCES['auth']}/login',
      'register': '$BASE_URL/${RESOURCES['auth']}/register',
      'logout': '$BASE_URL/${RESOURCES['auth']}/logout',
    },
    'birds': {
      'index': '$BASE_URL/${RESOURCES['birds']}',
    },
    'users': {
      'index': '$BASE_URL/${RESOURCES['users']}',
    },
    'prediction': {
      'index': '$BASE_URL/${RESOURCES['prediction']}',
    },
    'histories': {
      'index': '$BASE_URL/${RESOURCES['histories']}',
      'personal': '$BASE_URL/${RESOURCES['histories']}/user',
    },
    'orders': {
      'index': '$BASE_URL/${RESOURCES['orders']}',
    },
    'family': {
      'index': '$BASE_URL/${RESOURCES['family']}',
    },
    'status': {
      'index': '$BASE_URL/${RESOURCES['status']}',
    }
  };
}
