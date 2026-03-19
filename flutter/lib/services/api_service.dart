import 'dart:convert';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:http/http.dart' as http;

/// Centralized service for all API calls.
/// - Web / Windows / desktop : uses localhost:3000
/// - Android emulator        : uses 10.0.2.2:3000  (maps to host's localhost)
/// - Physical Android device : change to your machine's LAN IP, e.g. 192.168.x.x:3000
class ApiService {
  static String get _baseUrl =>
      kIsWeb ? 'http://localhost:3000/api_v1' : 'http://10.0.2.2:3000/api_v1';

  /// Registers a new API user.
  /// Returns null on success, or an error message string on failure.
  static Future<String?> registerUser({
    required String user,
    required String password,
    required String status,
    required String role,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/apiUser'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'user': user,
          'password': password,
          'status': status,
          'role': role,
        }),
      );

      if (response.statusCode == 201) {
        return null; // success
      } else {
        final body = jsonDecode(response.body);
        return body['error'] ?? 'Error al registrar el usuario';
      }
    } catch (e) {
      return 'No se pudo conectar con el servidor. Verifica que la API esté corriendo.';
    }
  }

  /// Logs in a user with [apiUser] and [apiPassword].
  /// Returns the JWT token on success, or null on failure.
  /// Also sets [errorMessage] with a description of the error when it fails.
  static Future<Map<String, dynamic>> loginUser({
    required String apiUser,
    required String apiPassword,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/apiUserLogin'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'api_user': apiUser,
          'api_password': apiPassword,
        }),
      );

      final body = jsonDecode(response.body);

      if (response.statusCode == 200 && body['token'] != null) {
        return {'success': true, 'token': body['token']};
      } else {
        return {
          'success': false,
          'error': body['error'] ?? 'Credenciales incorrectas',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'error': 'No se pudo conectar con el servidor. Verifica que la API esté corriendo.',
      };
    }
  }
}
