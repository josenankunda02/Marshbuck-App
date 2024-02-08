import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:marshbuck/common_widgets/call_invitatation.dart';
import 'package:marshbuck/services/firebase_helper.dart';
//import 'package:marshbuck/common_widgets/call_invitation.dart';
import 'package:marshbuck/common_widgets/appbar.dart';
import 'package:marshbuck/common_widgets/doctor_card.dart';
import 'package:marshbuck/models/user.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return CallInvitationPage(
      username: FirebaseHelper.currentUser.username,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(
                upperTitle: 'Welcome back,',
                title: FirebaseHelper.currentUser.name,
              ),
              Center(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseHelper.buildViews,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final List<QueryDocumentSnapshot>? docs =
                        snapshot.data?.docs;
                    if (docs == null || docs.isEmpty) {
                      return const Text('No data');
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: docs.length,
                      itemBuilder: (context, index) {
                        final model = UserModel.fromJson(
                          docs[index].data() as Map<String, dynamic>,
                        );
                        if (model.username !=
                            FirebaseHelper.currentUser.username) {
                          return UserCard(userModel: model);
                        }
                        return const SizedBox.shrink();
                      },
                    );
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
