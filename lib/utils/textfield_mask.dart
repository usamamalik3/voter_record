import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:voterrecord/utils/search_filtters.dart';

MaskTextInputFormatter cnicMask = MaskTextInputFormatter(
    mask: '#####-#######-#',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy);

getTextFieldMask(Filters filters) {
  switch (filters) {
    case Filters.byCNIC:
      return cnicMask;
    case Filters.byName:

    case Filters.byFather:

    case Filters.byNumber:

    case Filters.byGender:

    case Filters.byPolingstion:

    case Filters.bySerialNo:
  }
}
