import 'package:currencies/utils/text_styles.dart';
import 'package:currencies/widgets/input_decorations.dart';
import 'package:flutter/material.dart';

class AddDialog extends StatelessWidget {

  final TextEditingController pairController;
  final VoidCallback btnAction;
  final bool allFieldFilled;

  const AddDialog ({
    required this.pairController,
    required this.btnAction,
    this.allFieldFilled = false,
    Key? key}) : super(key: key);

  static String isRequired = 'Не все поля заполнены';

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!allFieldFilled)
            Padding(padding: const EdgeInsets.only(bottom: 10), child: Text(isRequired, style: TextStyles.error)),
          InputContainer(
            child: TextField(
              controller: pairController,
              decoration: InputContainer.inputField('Валютная пара'),
              keyboardType: TextInputType.text,
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith((states) => allFieldFilled ? Colors.blue : Colors.grey),
              ),
              child: const Text('Добавить'),
              onPressed: () => allFieldFilled ? btnAction.call() : null,
            ),
          ),
        ],
      ),
    );
  }
}
