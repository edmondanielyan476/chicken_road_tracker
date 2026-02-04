import 'package:chicken_road_tracker/constants/privacy_policy_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final GlobalKey privacyPolicyWebViewKey = GlobalKey();
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
    allowFileAccessFromFileURLs: true,
    allowUniversalAccessFromFileURLs: true,
    javaScriptCanOpenWindowsAutomatically: true,
    supportMultipleWindows: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffB8E6FE), Color(0xffDBEAFE), Color(0xffE9D4FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24,0,24,24),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 48,
                        height: 48,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/icons/arrow_left.png",
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Text(
                      "Privacy Policy",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1E2939),
                      ),
                    ),
                  ],
                ),
              ),

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
                  shouldOverrideUrlLoading:
                      (controller, navigationAction) async {
                        return NavigationActionPolicy.ALLOW;
                      },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
