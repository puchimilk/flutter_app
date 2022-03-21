import '/importer.dart';

Future<bool> showMessageDialog(
  BuildContext context, {
    required String message,
    String? title,
  }) async {
  return showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(message),
              Padding(padding: EdgeInsets.only(top: 32)),
              if (title != null) ...[
                Text(title),
                Padding(padding: EdgeInsets.only(top: 32)),
              ],
              SizedBox(
                height: 36,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      style: ButtonStyles.filledPrimary,
                      child: Text('OK'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      style: ButtonStyles.outlinedPrimary,
                      child: Text('キャンセル'),
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
