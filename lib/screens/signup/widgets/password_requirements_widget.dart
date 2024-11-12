import 'package:clario_test/resources/strings.dart';
import 'package:flutter/widgets.dart';

class PasswordRequirements extends StatelessWidget {
  final Color lengthRequirementColor;
  final Color uppercaseRequirementColor;
  final Color digitRequirementColor;

  const PasswordRequirements({
    required this.lengthRequirementColor,
    required this.uppercaseRequirementColor,
    required this.digitRequirementColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.lengthRequirement,
            style: TextStyle(color: lengthRequirementColor),
          ),
          Text(
            AppStrings.uppercaseRequirement,
            style: TextStyle(color: uppercaseRequirementColor),
          ),
          Text(
            AppStrings.digitRequirement,
            style: TextStyle(color: digitRequirementColor),
          ),
        ],
      ),
    );
  }
}
