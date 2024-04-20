import 'package:api/exports.dart';

class Endpoints {
  static ApiEndpointModel guest = ApiEndpointModel(
    post: "/app/plannerannie/v1/auth/signup/guest",
  );
  static ApiEndpointModel home = ApiEndpointModel(
    get: "/app/plannerannie/v1/home",
  );

  static ApiEndpointModel appointments = ApiEndpointModel(
    get: "/app/plannerannie/v1/appointments/{query}",
    list: "/app/plannerannie/v1/appointments",
    post: "/app/plannerannie/v1/appointments",
    patch: "/app/plannerannie/v1/appointments/{query}",
  );

  static ApiEndpointModel clients = ApiEndpointModel(
    get: "/app/plannerannie/v1/clients/{query}",
    list: "/app/plannerannie/v1/clients",
    patch: "/app/plannerannie/v1/clients/{query}",
    post: "/app/plannerannie/v1/clients",
  );
  static ApiEndpointModel clientsHistory = ApiEndpointModel(
    get: "/app/plannerannie/v1/clients/history/{query}",
  );
  static ApiEndpointModel clientsUpcoming = ApiEndpointModel(
    get: "/app/plannerannie/v1/clients/upcoming/{query}",
  );

  static ApiEndpointModel profile = ApiEndpointModel(
    get: "/app/plannerannie/v1/profile",
    patch: "/app/plannerannie/v1/profile",
  );

  static ApiEndpointModel services = ApiEndpointModel(
    get: "/app/plannerannie/v1/services/{query}",
    list: "/app/plannerannie/v1/services",
    patch: "/app/plannerannie/v1/services/{query}",
    post: "/app/plannerannie/v1/services",
  );
  static ApiEndpointModel servicesHistory = ApiEndpointModel(
    get: "/app/plannerannie/v1/services/history/{query}",
  );
  static ApiEndpointModel servicesUpcoming = ApiEndpointModel(
    get: "/app/plannerannie/v1/services/upcoming/{query}",
  );

  static ApiEndpointModel wiki = ApiEndpointModel(get: "/wiki/v1/reader/");
}
