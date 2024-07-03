import 'package:flutter/material.dart';
import 'package:goodwishes/pages/licenses_page.dart';

class LicenseButton extends StatelessWidget {
  const LicenseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LicensesPage(),
          ),
        );
      },
      child: const Text('Licenses'),
    );
  }
}
