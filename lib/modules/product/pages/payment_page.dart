import 'package:flutter/material.dart';
import 'package:flutter_grocery_store/modules/product/pages/payment_result_page.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {

    WebViewController controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.contains('order-complete')) {
              final Uri uri = Uri.parse(request.url);
              Get.off(PaymentResultPage(type: uri.queryParameters['type'] ?? "", id: uri.queryParameters["id"] ?? ""));
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    return WebViewWidget(controller: controller);
  }
}
