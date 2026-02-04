import 'package:chicken_road_tracker/constants/terms_and_conditions_link.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  final GlobalKey termsAndConditionsWebViewKey = GlobalKey();
  InAppWebViewController? termsAndConditionsWebViewController;

  /// IMPORTANT!: Settings for the Terms And Conditions WebView. This is required to ensure proper loading and functionality.
  InAppWebViewSettings termsAndConditionsWebViewsettings = InAppWebViewSettings(
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
                    Expanded(
                      child: Text(
                        "Terms And Conditions",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1E2939),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              /// Terms And Conditions WebView
              Expanded(
                child: InAppWebView(
                  key: termsAndConditionsWebViewKey,
                  initialUrlRequest: URLRequest(
                    url: WebUri(
                      ApplicationTermsAndConditionsLink.url,
                    ), // showing Terms And Conditions
                  ),
                  initialSettings:
                      termsAndConditionsWebViewsettings, // Terms And Conditions webview settings
                  onWebViewCreated: (controller) {
                    termsAndConditionsWebViewController =
                        controller; // setting up Terms And Conditions webview controller
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
