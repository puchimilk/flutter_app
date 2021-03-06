import 'package:flutter_app/importer.dart';

class ButtonStyles {
  static ButtonStyle get filledPrimary {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(AppColors.primary),
      foregroundColor: MaterialStateProperty.all(Colors.white),
    );
  }

  static ButtonStyle get outlinedPrimary {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      foregroundColor: MaterialStateProperty.all(AppColors.primary),
      side: MaterialStateProperty.all(
        const BorderSide(color: AppColors.primary),
      ),
    );
  }
}
