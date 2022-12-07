enum Filters {
  byCNIC,
  byName,
  byFather,
  byNumber,
  byGender,
  byPolingstion,
  bySerialNo
}

getFliterName(Filters filters) {
  switch (filters) {
    case Filters.byCNIC:
      return "شناختی کارڈ";
    case Filters.byName:
      return "نام";
    case Filters.byFather:
      return "والد کا نام";
    case Filters.byNumber:
      return "نمبر";
    case Filters.byGender:
      return "صنف";
    case Filters.byPolingstion:
      return "پولنگ اسٹیشن";
    case Filters.bySerialNo:
      return "سیریل نمبر";
  }
}

getFliterVariable(Filters filters) {
  switch (filters) {
    case Filters.byCNIC:
      return "cnic";
    case Filters.byName:
      return "name";
    case Filters.byFather:
      return "fathername";
    case Filters.byNumber:
      return "نمبر";
    case Filters.byGender:
      return "gender";
    case Filters.byPolingstion:
      return 'polingstion';
    case Filters.bySerialNo:
      return "serialno";
  }
}
