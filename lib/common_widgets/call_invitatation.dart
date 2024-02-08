import 'package:flutter/material.dart';
import 'package:marshbuck/common_widgets/static.dart';
//import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class CallInvitationPage extends StatelessWidget {
  const CallInvitationPage({
    super.key,
    required this.child,
    required this.username,
  });

  final Widget child;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child,
        ZegoUIKitPrebuiltCallWithInvitation(
          appID: Statics.appID,
          appSign: Statics.appSign,
          userID: username,
          userName: username,
          plugins: [ZegoUIKitSignalingPlugin()],
          child: child,
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  ZegoUIKitPrebuiltCallWithInvitation(
      {required int appID,
      required String appSign,
      required String userID,
      required String userName,
      required List<ZegoUIKitSignalingPlugin> plugins,
      required Widget child}) {}
}
