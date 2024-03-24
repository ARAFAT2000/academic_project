import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/modify_text.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
              radius: 35,
              child: Icon(Icons.person)),
          title: ModifyText(text: 'Md Arafat Islam', size: 18, color:Colors.black),
          subtitle: ModifyText(text: 'Flutter Developer', size: 14, color:Colors.black),

        ),
      ),
    );
  }
}