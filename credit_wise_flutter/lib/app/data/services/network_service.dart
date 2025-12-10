import "dart:async";
import "package:credit_wise_flutter/app/data/services/config_service.dart";
import "package:flutter/material.dart";

class NetworkService {
  final ConfigService _configService;

  NetworkService(this._configService);

  Future<String> getApiBaseUrl() async {
    // Ensure the config is loaded before accessing the API base URL
    await _configService.loadConfig();

    debugPrint("Protected API Base URL: ${_configService.apiBaseUrl}");
    
    return _configService.apiBaseUrl;
  }
}