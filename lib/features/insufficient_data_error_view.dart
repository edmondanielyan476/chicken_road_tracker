import 'package:chicken_road_tracker/constants/privacy_policy_link.dart';
import 'package:chicken_road_tracker/start_application.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class InsufficientDataErrorView extends StatefulWidget {
  const InsufficientDataErrorView({super.key});

  @override
  State<InsufficientDataErrorView> createState() =>
      _InsufficientDataErrorViewState();
}

class _InsufficientDataErrorViewState extends State<InsufficientDataErrorView> {
  // Privacy Policy WebView Key
  final GlobalKey privacyPolicyWebViewKey = GlobalKey();
  // Privacy Policy WebView Controller
  InAppWebViewController? privacyPolicyWebViewController;

  /// IMPORTANT!: Settings for the Privacy Policy WebView. This is required to ensure proper loading and functionality.
  InAppWebViewSettings privacyPolicyWebViewsettings = InAppWebViewSettings(
    isInspectable: true,
    javaScriptEnabled: true,
    domStorageEnabled: true,
    allowsInlineMediaPlayback: true,
    thirdPartyCookiesEnabled: true,
    allowsBackForwardNavigationGestures: true,
    databaseEnabled: true,
    userAgent:
        "Mozilla/5.0 (Linux; Android 13; Pixel 7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/116.0.0.0 Mobile Safari/537.36",
    allowFileAccessFromFileURLs: true,
    allowUniversalAccessFromFileURLs: true,
    javaScriptCanOpenWindowsAutomatically: true,
    supportMultipleWindows: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (onboardingData.length >= 3) ...[
            Center(
              child: Text(
                'Insufficient Data',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'The application could not retrieve enough data to proceed. Please try again later.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 32),
            Text("Privacy Policy"),
          ],

          /// Privacy Policy WebView
          Expanded(
            child: InAppWebView(
              key: privacyPolicyWebViewKey,
              initialUrlRequest: URLRequest(
                url: WebUri(
                  ApplicationPrivacyPolicyLink.url,
                ), // showing privacy policy
              ),
              initialSettings:
                  privacyPolicyWebViewsettings, // privacy policy webview settings
              onWebViewCreated: (controller) {
                privacyPolicyWebViewController =
                    controller; // setting up privacy policy webview controller
              },
              shouldOverrideUrlLoading: (controller, navigationAction) async {
                return NavigationActionPolicy.ALLOW;
              },
            ),
          ),
        ],
      ),
    );
  }
}
