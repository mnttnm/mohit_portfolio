import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mohit_portfolio/constants/colors.dart';
import 'package:mohit_portfolio/pages/contact_me/contact_form.dart';
import 'package:mohit_portfolio/pages/contact_me/contact_form_notifier.dart';

enum TextType { symbol, keyword, variable, string, lineNo }

const Map<TextType, Color> textColorMap = {
  TextType.keyword: accentPurpleColor,
  TextType.symbol: secondaryGreenColor,
  TextType.lineNo: secondaryGreyColor,
  TextType.variable: projectTitleColor,
  TextType.string: accentOrangeColor
};

TextSpan getCustomTextSpan({required String text, required TextType textType}) {
  return TextSpan(
    text: text,
    style: TextStyle(
      color: textColorMap[textType],
      fontSize: 17,
      height: 1.4,
    ),
  );
}

class ContactFormPayload extends ConsumerWidget {
  const ContactFormPayload({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    FormInfo formInfo = ref.watch(contactFormProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: '1',
            style: TextStyle(
              color: textColorMap[TextType.lineNo],
              fontSize: 17,
            ),
            children: [
              getCustomTextSpan(text: '    void ', textType: TextType.keyword),
              getCustomTextSpan(
                  text: 'sendMessage', textType: TextType.variable),
              getCustomTextSpan(text: '(', textType: TextType.symbol),
              getCustomTextSpan(text: 'String ', textType: TextType.keyword),
              getCustomTextSpan(text: 'message', textType: TextType.variable),
              getCustomTextSpan(text: ') ', textType: TextType.symbol),
              getCustomTextSpan(text: 'async ', textType: TextType.keyword),
              getCustomTextSpan(text: '{\n', textType: TextType.symbol),
              getCustomTextSpan(text: '2', textType: TextType.lineNo),
              getCustomTextSpan(
                  text: '      final ', textType: TextType.keyword),
              getCustomTextSpan(text: 'response', textType: TextType.variable),
              getCustomTextSpan(text: ' = ', textType: TextType.symbol),
              getCustomTextSpan(text: 'await ', textType: TextType.keyword),
              getCustomTextSpan(
                  text: ' http.post', textType: TextType.variable),
              getCustomTextSpan(text: '(', textType: TextType.symbol),
              getCustomTextSpan(text: 'Uri.parse', textType: TextType.keyword),
              getCustomTextSpan(text: '(', textType: TextType.symbol),
              getCustomTextSpan(
                text: '"https://say.hello.to.mohit"',
                textType: TextType.string,
              ),
              getCustomTextSpan(text: ')', textType: TextType.symbol),
              getCustomTextSpan(text: ')', textType: TextType.symbol),
              getCustomTextSpan(text: ';\n', textType: TextType.symbol),
              getCustomTextSpan(text: '3', textType: TextType.lineNo),
              getCustomTextSpan(text: '      if ', textType: TextType.keyword),
              getCustomTextSpan(text: ' (', textType: TextType.symbol),
              getCustomTextSpan(
                  text: 'response.statusCode', textType: TextType.variable),
              getCustomTextSpan(text: ' == ', textType: TextType.symbol),
              getCustomTextSpan(text: '201 ', textType: TextType.string),
              getCustomTextSpan(text: ')', textType: TextType.symbol),
              getCustomTextSpan(text: ' {\n', textType: TextType.symbol),
              getCustomTextSpan(text: '4', textType: TextType.lineNo),
              getCustomTextSpan(
                  text: '        print', textType: TextType.keyword),
              getCustomTextSpan(text: '(', textType: TextType.symbol),
              getCustomTextSpan(
                  text: '"Excited to connect with you, Will reply back soon!"',
                  textType: TextType.string),
              getCustomTextSpan(text: ')', textType: TextType.symbol),
              getCustomTextSpan(text: ';\n', textType: TextType.symbol),
              getCustomTextSpan(text: '5', textType: TextType.lineNo),
              getCustomTextSpan(
                  text: '      } else ', textType: TextType.symbol),
              getCustomTextSpan(text: ' {\n', textType: TextType.symbol),
              getCustomTextSpan(text: '6', textType: TextType.lineNo),
              getCustomTextSpan(
                  text: '        print', textType: TextType.keyword),
              getCustomTextSpan(text: '(', textType: TextType.symbol),
              getCustomTextSpan(
                  text:
                      '"Oo oh, This does not seem to work, ping me on my socials !"',
                  textType: TextType.string),
              getCustomTextSpan(text: ')', textType: TextType.symbol),
              getCustomTextSpan(text: ';\n', textType: TextType.symbol),
              getCustomTextSpan(text: '7', textType: TextType.lineNo),
              getCustomTextSpan(text: '      }\n', textType: TextType.symbol),
              getCustomTextSpan(text: '8', textType: TextType.lineNo),
              getCustomTextSpan(text: '    }\n', textType: TextType.symbol),
              getCustomTextSpan(text: '9\n', textType: TextType.lineNo),
              getCustomTextSpan(text: '10', textType: TextType.lineNo),
              getCustomTextSpan(
                text: '   const ',
                textType: TextType.keyword,
              ),
              getCustomTextSpan(
                text: ' message ',
                textType: TextType.variable,
              ),
              getCustomTextSpan(
                text: ' = ',
                textType: TextType.keyword,
              ),
              getCustomTextSpan(
                text: ' { \n',
                textType: TextType.symbol,
              ),
              getCustomTextSpan(text: '11 ', textType: TextType.lineNo),
              getCustomTextSpan(
                  text: '     "name"', textType: TextType.variable),
              getCustomTextSpan(
                text: ' :',
                textType: TextType.symbol,
              ),
              getCustomTextSpan(
                text: '   "${formInfo.name}"',
                textType: TextType.string,
              ),
              getCustomTextSpan(
                text: ',\n',
                textType: TextType.symbol,
              ),
              getCustomTextSpan(text: '12 ', textType: TextType.lineNo),
              getCustomTextSpan(
                  text: '     "email"', textType: TextType.variable),
              getCustomTextSpan(
                text: ' :',
                textType: TextType.symbol,
              ),
              getCustomTextSpan(
                text: '   "${formInfo.email}"',
                textType: TextType.string,
              ),
              getCustomTextSpan(
                text: ',\n',
                textType: TextType.symbol,
              ),
              getCustomTextSpan(text: '13 ', textType: TextType.lineNo),
              getCustomTextSpan(
                  text: '     "message"', textType: TextType.variable),
              getCustomTextSpan(
                text: ' :',
                textType: TextType.symbol,
              ),
              getCustomTextSpan(
                text: '   "${formInfo.message}"',
                textType: TextType.string,
              ),
              getCustomTextSpan(
                text: ',\n',
                textType: TextType.symbol,
              ),
              getCustomTextSpan(text: '14 ', textType: TextType.lineNo),
              getCustomTextSpan(text: '   }', textType: TextType.symbol),
              getCustomTextSpan(text: ';\n', textType: TextType.symbol),
              getCustomTextSpan(text: '15\n', textType: TextType.lineNo),
              getCustomTextSpan(text: '16', textType: TextType.lineNo),
              getCustomTextSpan(
                  text: '   sendMessage', textType: TextType.keyword),
              getCustomTextSpan(text: '(', textType: TextType.symbol),
              getCustomTextSpan(text: 'message', textType: TextType.variable),
              getCustomTextSpan(text: ')', textType: TextType.symbol),
              getCustomTextSpan(text: ';', textType: TextType.symbol),
            ],
          ),
        ),
      ],
    );
  }
}
