import 'package:flutter/material.dart';

import '../const.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Privacy Policy',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 85, 84, 84)),
              ),
            ),
            SizedBox(height: 20),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: korangecolor,
                ),
                width: double.infinity,
                height: 500,
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'We are committed to ensuring that your privacy is protected.',
                        style: TextStyle(fontSize: 18, color: kwhite),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Information We Collect:',
                        style: TextStyle(
                            fontSize: 18,
                            color: kwhite,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'We collect basic user information such as name and email address for account creation and communication purposes.',
                        style: TextStyle(fontSize: 18, color: kwhite),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'How We Use Your Information:',
                        style: TextStyle(
                            fontSize: 18,
                            color: kwhite,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Your information is used to personalize your experience, improve our app, and send you relevant updates and notifications.',
                        style: TextStyle(fontSize: 18, color: kwhite),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Contact Us:',
                        style: TextStyle(
                            fontSize: 18,
                            color: kwhite,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'If you have any questions or concerns about our privacy policy, please contact us at privacy@habittrackerapp.com.',
                        style: TextStyle(fontSize: 18, color: kwhite),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
