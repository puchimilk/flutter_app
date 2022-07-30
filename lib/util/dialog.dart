import 'package:flutter_app/importer.dart';

Future<bool> showMessageDialog(
  BuildContext context, {
    required String message,
    String? title,
  }) async {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              pt32,
              if (title != null) ...[
                Text(title),
                pt32,
              ],
              SizedBox(
                height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        style: ButtonStyles.filledPrimary,
                        child: const Text('決定'),
                      ),
                    ),
                    pl8,
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        style: ButtonStyles.outlinedPrimary,
                        child: const Text('キャンセル'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  ).then((result) => result ?? false);
}
