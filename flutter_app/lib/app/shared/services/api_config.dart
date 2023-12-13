class ApiConfig {
  static const String BASE_URL =
      "https://76ca-2001-ee0-4b43-dc10-99c6-3b61-60f4-26fe.ngrok-free.app/api";

  static const Map<String, String> RESOURCES = {
    'auth': 'auth',
    'birds': 'birds',
    'histories': 'histories',
    'prediction': 'prediction'
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
  };
}
