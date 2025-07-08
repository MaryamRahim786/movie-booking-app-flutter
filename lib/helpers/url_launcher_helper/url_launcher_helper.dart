import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  /// Launches a URL in the default browser.
  static Future<void> launchUrlAddress(String url,
      {BuildContext? context}) async {
    final uri = Uri.tryParse(url);
    if (uri == null) {
      debugPrint("Invalid URL: $url");
      if (context != null) {
        showSnackBar(context, "Invalid URL: $url");
      }
      return;
    }

    if (!await canLaunchUrl(uri)) {
      debugPrint("Cannot launch URL: $url");
      if (context != null) {
        showSnackBar(context, "Cannot launch URL: $url");
      }
      return;
    }

    // Pass the proper launch mode
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  /// Checks if a URL can be launched.
  static Future<bool> canLaunchUrlAddress(String url) async {
    final uri = Uri.tryParse(url);
    return uri != null && await canLaunchUrl(uri);
  }

  /// Launches a phone dialer with the given phone number.
  static Future<void> launchPhone(String phoneNumber,
      {BuildContext? context}) async {
    final uri = Uri(scheme: 'tel', path: phoneNumber);
    await _launchWithFallback(uri, context);
  }

  /// Opens the default email client with the given email address.
  static Future<void> launchEmail(String email,
      {String? subject, String? body, BuildContext? context}) async {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      query: {
        if (subject != null) 'subject': subject,
        if (body != null) 'body': body,
      }
          .entries
          .map((e) => '${e.key}=${Uri.encodeComponent(e.value)}')
          .join('&'),
    );
    await _launchWithFallback(uri, context);
  }

  /// Opens a WhatsApp chat with the given phone number and optional message.
  static Future<void> launchWhatsApp(String phoneNumber,
      {String? message, BuildContext? context}) async {
    final uri = Uri(
      scheme: 'https',
      host: 'wa.me',
      path: phoneNumber,
      queryParameters: message != null ? {'text': message} : null,
    );
    await _launchWithFallback(uri, context);
  }

  /// Internal method to handle fallback for failed launches.
  static Future<void> _launchWithFallback(
      Uri uri, BuildContext? context) async {
    if (!await canLaunchUrl(uri)) {
      debugPrint("Cannot launch URL: $uri");
      if (context != null) {
        showSnackBar(context, "Cannot launch URL: $uri");
      }
      return;
    }

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  /// Utility to show a snack bar for errors.
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
