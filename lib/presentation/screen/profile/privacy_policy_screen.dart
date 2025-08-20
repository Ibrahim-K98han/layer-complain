import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:layer_complain/utils/constraints.dart';
import 'package:layer_complain/utils/utils.dart';
import 'package:layer_complain/widgets/custom_appbar.dart';
import 'package:layer_complain/widgets/custom_text.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: CustomAppBar(title: 'Privacy Policy'),
      body: ListView(
        children: [
          Padding(
            padding: Utils.symmetric(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Section
                _buildSectionDescription(
                  'Welcome to ConsCom! Your privacy is important to us, and we are committed to protecting it through our compliance with this policy.',
                ),
                const SizedBox(height: 24),

                // Information We Collect
                _buildSectionTitle('Information We Collect'),
                const SizedBox(height: 12),
                _buildSectionDescription(
                  'We collect information to provide better services to all our users. This information includes:',
                ),
                const SizedBox(height: 12),
                _buildBulletPoint(
                  'Personal Information: Name, email address, phone number.',
                ),
                _buildBulletPoint(
                  'Usage Data: Information about how you use our website and services, including.',
                ),
                _buildBulletPoint(
                  'Service-Specific Data: Information related to the on-demand services.',
                ),
                const SizedBox(height: 24),

                // How We Use Your Information
                _buildSectionTitle('How We Use Your Information'),
                const SizedBox(height: 12),
                _buildSectionDescription(
                  'We use the information we collect for various purposes, including:',
                ),
                const SizedBox(height: 12),
                _buildBulletPoint('Providing and maintaining our services.'),
                _buildBulletPoint(
                  'Processing transactions and sending related information.',
                ),
                _buildBulletPoint(
                  'Improving, personalizing, and developing our services.',
                ),
                const SizedBox(height: 24),

                // Sharing Your Information
                _buildSectionTitle('Sharing Your Information'),
                const SizedBox(height: 12),
                _buildSectionDescription(
                  'We may share your information with third parties in the following situations',
                ),
                const SizedBox(height: 12),
                _buildBulletPoint(
                  'With Service Providers: To facilitate the on-demand services as requested, we may',
                ),
                _buildBulletPoint(
                  'For Legal Reasons: If required by law or to protect our rights and safety.',
                ),
                _buildBulletPoint(
                  'With Your Consent: When you provide explicit consent to share your information with third parties.',
                ),
                const SizedBox(height: 24),

                // Contact Us
                _buildSectionTitle('Contact Us'),
                const SizedBox(height: 12),
                _buildSectionDescription(
                  'If you have any questions or concerns about this Privacy Policy or our data practices, please contact us at: ConsCom@gmail.com',
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return CustomText(text: title, fontWeight: FontWeight.w600);
  }

  Widget _buildSectionDescription(String description) {
    return CustomText(text: description);
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8.0, right: 12.0),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: textColor,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(child: CustomText(text: text, color: lightTextColor)),
        ],
      ),
    );
  }
}
