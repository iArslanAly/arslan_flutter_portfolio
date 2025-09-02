import 'package:flutter/material.dart';

import '../../../../core/constants/text_strings.dart';
import 'contact_info_item.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        ContactInfoItem(
          icon: Icons.phone,
          label: TextStrings.labelPhone,
          value: TextStrings.phone,
          showDivider: true,
        ),
        SizedBox(height: 20),
        ContactInfoItem(
          icon: Icons.email,
          label: TextStrings.labelEmail,
          value: TextStrings.email,
          showDivider: true,
        ),
        SizedBox(height: 20),
        ContactInfoItem(
          icon: Icons.location_on,
          label: TextStrings.labelAddress,
          value: TextStrings.address,
          showDivider: false,
        ),
      ],
    );
  }
}
