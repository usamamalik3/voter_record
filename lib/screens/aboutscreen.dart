import 'package:flutter/material.dart';
class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  bool _customTileExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(children:  [
          Directionality(
             textDirection: TextDirection.rtl,
            child: ExpansionTile(
              title:  const Text('تحریک کا تعارف',  style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 15),),
             
              trailing: Icon(
                _customTileExpanded
                    ? Icons.arrow_drop_down_circle
                    : Icons.arrow_drop_down,
                    textDirection: TextDirection.rtl,
              ),
              children: const <Widget>[
                ListTile(title: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('تحریکِ لبیک پاکستان (ٹی ایل پی) ایک پاکستانی سیاسی جماعت ہے، جو تحریک لبیک یا رسول اللہ صلی اللہ علیہ وآلہ وسلم نامی جماعت کے سربراہ امیر المجاہدین ،حافظِ قُرآن وأحادیثِ طَوِیلہ وکثیرہ وحَدائِقِ بَخشِش ورُومِیات وإقبالیات وشَیرازِیات بابا جی  خادم حسین رضوی رحمتہ اللہ علیہ کی زیر قیادت قائم ہوئی۔ 26جولائی 2017ء کو الیکشن کمیشن آف  پاکستان میں رجسٹرڈ  ہوئی اور اس تنظیم کو کرین کا انتخابی نشان دیا گیا۔موجودہ امیر جانشین امیر المجاہدین علامہ سعد حسین رضوی دامت برکاتہم العالیہ ہیں۔ ٹی ایل پی پاکستان کے بھرے سیاسی بازار میں ایک نئی شمولیت ہے، پاکستان تو پاکستان اس تحریک نے دنیا بھر میں یہ توجہ مبذول کروائی  کہ ختم نبوت اور ناموس رسالت ایک حساس مسئلہ ہے اس مسئلہ کی حساسیت کو سمجھیں یہ ہمارے دین اسلام کی اساس ہے۔پچھلے چندسال کے قلیل عرصہ میں، ٹی ایل پی نے پاکستان میں دو منتخب حکومتوں کو اپنے نظریے کی قانونی حیثیت کو قبول کرنے پر مجبور کیا۔اور باور کروایا کہ ہمارا نظریہ وہی ہے جو بانیان پاکستان علامہ محمد اقبال اور محمد علی جناح کے پاکستان کا نظریہ ہے۔ یعنی پاکستان کا مطلب کیا ۔؟ لا الہ الااللہ ،    دستور ریاست کیا ہوگا۔؟محمد رسول اللہ۔ٹی ایل پی کی آمد کے بعد  گلی گلی، نگر نگر ،گوشہ گوشہ، یہ نعرہ عام ہوا ، لبیک لبیک لبیک یا رسول اللہ ۔تاجدار ِختم نبوت زندہ باد ،زندہ باد،زندہ باد۔من سب نبیاََ فقتلوہ۔گستاخ رسول کی ایک سزا سر تن سے جدا ،سرتن سے جدا۔یہی وجہ ہےکہ اغیار تو اغیار اپنے آپ کوعاشق رسول کہنے والےاغیار کے آلہ کار ملک کے بعض  مذہبی ،سیاسی،سماجی، سویلین اور عسکری رہنماؤں نے بھی ٹی ایل پی اور اس کے نظریے سے نمٹنے کے لیے ایک مربوط حکمت عملی کے تحت اسے کلعدم قرار دے دیا،اس کے افعال کودہشتگردی سے تعبیر کیا،دشمن کا ایجنٹ کہا،اور اپنے تئیں اسے سیاسی منظر نامے سے باہر نکالنے کی غرض سے بھرپور جدوجہد کی لیکن پاکستان کی تاریخ میں پہلی مرتبہ ایسا ہوا کہ کسی سیاسی جماعت کوکلعدم قرار دیا گیا ہو اور پھر دوبارہ اس کا سٹیٹس بحال کیا ہو۔ یہ محض اللہ تعالیٰ کے فضل و کرم ، نبی پاک شاہ لولاک صلی اللہ علیہ وسلم کی نظر رحمت ، شہداء ِختم نبوت اور ناموس رسالت کی قربانیوں کے ساتھ ساتھ قائدین کی استقامت کےمرہون منت ہے۔',
                   textDirection: TextDirection.rtl,
                    style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 15),
                    ),
                )),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _customTileExpanded = expanded);
              },
            ),
          ),
          const Directionality(
            textDirection: TextDirection.rtl,
            child: ExpansionTile(
              title: Text('تحریک کی بنیاد', style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 15),),
              controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                 Text('',
                 textDirection: TextDirection.rtl,
                  style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 16),),
              ],
            ),
          ),
           const Directionality(
            textDirection: TextDirection.rtl,
            child: ExpansionTile(
              title: Text('تحریک کے اغراض و مقاصد', style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 15),),
              controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                 Padding(
                   padding: EdgeInsets.all(12.0),
                   child: Text('تحریک لبیک پاکستان تحریکی طور پر معرض وجود آنے والی ایک مذہبی سیاسی جماعت ہونے کے ساتھ ساتھ ایک ایسا پاکستان دیکھنا چاہتی ہے جہاں اللہ کے رسول صلی اللہ علیہ وآلہ وسلم کی عزت اور ناموس پہ کسی بھی قسم کا سمجھوتہ نہ ہو۔ٹی ایل پی  کا مقصد یہ ہے کہ پاکستان کا نظام عدل ہی نہیں بلکہ پاکستان کا مکمل نظام حکومت اسلام کے عین اصولوں کے مطابق ہو۔ایک ایسا پاکستان جہاں پر غازیان اسلام کو دہشتگرد نہ بنایا جائے، اور گستاخان رسول کےلئے کسی بھی قسم کا نرم گوشہ نہ رکھا جائے۔ ہمارا ماننا ہے کہ جب یہ ملک لاالہ اللہ کی بنیاد پر بنا ہے تو یہاں نظام بھی محمد رسول اللہ والا ہونا چاہئے۔یہی ہمارا منشور ہے ""اسلام ،پاکستان اور عوام""۔ ہمارا مقصد نہ کسی کو گرانا ہے اور نہ کسی کو اٹھانا ہے"" بس!حضور کے دین کو تخت پر لانا ہے""۔ آیا آیا دین آیا، آیا آیا دین آیا۔ ہم یہ جانتے ہیں کہ دین کو قائم کرنا ہر ایک پر فرض نہیں ہے لیکن دین کےلئے جدوجہد کرنا ہر کلمہ پڑھنے والے مسلمان (مرد اورعورت)پر فرض ہے۔ اسی جدوجہد کےپیشِ نظر تحریک لبیک پاکستان میدان عمل میں ہے۔',
                   textDirection: TextDirection.rtl,
                    style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 16),),
                 ),
              ],
            ),
          ),
          const Directionality(
            textDirection: TextDirection.rtl,
            child: ExpansionTile(
              title: Text('ضمنی انتخابات 2017ءاور 2018ء', style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 15),),
              controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                 Padding(
                   padding: EdgeInsets.all(12.0),
                   child: Text('نواز شریف کی نااہلی پر خالی ہونے والی حلقہ این اے۔120 کی نشست پر ہونے والے ضمنی انتخابات 17 ستمبر 2017ء میں پہلی بار انتخاب لڑا اور تیسری پوزیشن لی۔گلزار خان کی وفات پر خالی ہونے والی حلقہ این اے۔4 کی نشست پر ہونے والے ضمنی انتخابات 2017ء میں پانچویں پوزیشن حاصل کی۔جہانگیر ترین کی نااہلی پر خالی ہونے والی حلقہ این اے۔154 کی نشست پر ہونے والے ضمنی انتخابات 12 فروری 2018ء میں تیسری پوزیشن حاصل کی۔',
                   textDirection: TextDirection.rtl,
                    style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 16),),
                 ),
              ],
            ),
          ),
          const Directionality(
            textDirection: TextDirection.rtl,
            child: ExpansionTile(
              title: Text('احتجاج اور دھرنے', style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 15),),
              controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                 Padding(
                   padding: EdgeInsets.all(12.0),
                   child: Text('نومبر 2017 ءمیں، اٹک میں پیدا ہونے والے، لاہور میں مقیم تحریک لبیک پاکستان کے امیر  علامہ خادم حسین رضوی کی قیادت میں ہزاروں مظاہرین نے پاکستان کے دارالحکومت اسلام آباد جانے والے راستے کو فیض آباد کے مقام سے بند کر دیا کیوں کہ"  آئینی ترمیم "الیکشن بل" 2017ء میں ختم نبوت کے حوالہ سے "حلف نامہ" کے الفاظ کو بدل دیا گیا تھا۔ مظاہرین نے حکومت سے مطالبہ کیا ہے کہ وہ وزیر قانون زاہد حامد سے استعفیٰ لے۔ یہ حلف نامہ ختم نبوت سے متعلق تھا جو پاکستان میں سیاسی امیدوار پارلیمنٹ میں داخل ہونے کے لیے الیکشن لڑنے سے پہلے لیتے ہیں۔تحریک لبیک پاکستان اور تحریک لبیک یا رسول اللہ نے احتجاج شروع کیاجو الیکشن کمیشن میں رجسٹرڈ اایک سیاسی جماعت ہونے کے ناطے ان کا آئینی، قانونی اور جمہوری  حق تھانیز مذہبی سیاسی جماعت ہونے کے ناطے فرض تھا۔ ہونا تو یوں چاہئے تھا کہ اسلام کے نام پر معرض وجود میں آنی والی ایک مملکت خداداد  "اسلامی جمہوریہ پاکستان"میں ختم نبوت کے معاملہ پر ڈاکے ڈالنے والوں  کو بےنقاب کر کے قرار واقعی سزا دی جاتی الٹا  پر امن احتجاج کرنے والے مظاہرین پر حکومت نے بڑے پیمانے پرتشدد کرنا شروع کیا۔اور بہت سی گرفتاریاں عمل میں لانا شروع کر دیں۔ احتجاج اکیس (21 ) دن تک جاری رہا، اسلام آباد کے رہائشی مشکلات سے دوچار رہے کیونکہ مظاہرین اور قانون نافذ کرنے والے اہلکاروں کے درمیان سڑکوں پر جھڑپیں ہوتی رہیں۔ اس دوران میں تحریک کے سات (7)افراد شہید اور 200 سے زائد زخمی ہوئے۔  حکومت نے 25 نومبر کو ایک ناکام آپریشن کیا، جس کے بعد ملک بھر میں مظاہرے شروع ہو گئے اور حکومت مزید دباؤ میں آگئی، کئی شہروں اور شاہراہوں کو تاجدار ختم نبوت کے غلاموں  نے بند کر دیا اور ذرائع نقل و حمل متاثر ہوئی، آخر کار حکومت نے 27 نومبر کو مذاکرات کے بعد ایک معاہدے پر دستخط کیے، جس کے بعد زاہد حامد نے استعفیٰ دے دیا اور دھرنا ختم کر دیا گیا۔ جب کہ دوسری طرف لاہور میں کنز العلماء علامہ اشرف آصف جلالی صاحب نے دھرنا دیا تھا جو بعد میں کسی نتیجے پر نہیں پہنچا اور ختم کر دیا گیا تھا۔فیض آباد والا دھرنا اس لئے ختم کر دیا گیا کہ پاکستانی فوج کی جانب سے حکومت وقت کو یہ سمجھایا گیا کہ یہ جماعت طالبان القاعدہ یا دیگر عسکریت پسند گروہوں جیسی جماعت نہیں بلکہ ایک رجسٹرڈ سیاسی پارٹی ہے۔ وہ جو مطالبات کر رہے ہیں مسلم لیگ (ن) کی حکومت پر امن طریقے سےاحتجاج اور  دھرنے کو تشدد سے بچنے کے لیے سنبھالےاور مظاہرین کے جائز مطالبات فوری مانے جائیں کیونکہ "یہ قومی مفاد میں نہیں ہے۔"دھرنا اس وقت ختم ہوا جب فوج نے خود مظاہرین اور شریف حکومت کے درمیان کردار ادا کیا۔ مظاہرین کے مطالبے پر وزیراعظم نواز شریف  کو اپنے وزیر قانون زاہد حامد کو بھی چھوڑنا پڑا۔ پاکستان کی انٹر سروسز انٹیلی جنس (آئی ایس آئی) کے سابق سربراہ اور اس وقت آئی ایس آئی کے انسداد انٹیلی جنس ونگ کے ڈائریکٹر جنرل لیفٹیننٹ جنرل فیض حمید نے ثالث کے طور پر حکومت اور ٹی ایل پی کے درمیان معاہدے پر دستخط کیے۔معاہدے کے بعد جب مظاہرین منتشر ہونا شروع ہوئے تو سوشل میڈیا پر ایک ویڈیو وائرل ہوئی جس میں ایک سینئر فوجی اہلکار کو ہر ایک مظاہرین کو 1000 روپے تقسیم کرتے ہوئے دکھایا گیا تاکہ وہ اپنے آبائی شہروں کو واپس جا سکیں۔اگرچہ ٹی ایل پی نوازشریف کی حکومت کو گرانے میں ناکام رہی تھی، لیکن اس نے انہیں ایک ایسا دھچکا پہنچایا جس نے اقتدار پر وزیر اعظم کی گرفت کو نمایاں طور پر کمزور کر دیا اور اشارہ دیا کہ ٹی ایل پی اب ایک ایسی قوت ہے جو اسلامی ملک میں غیر اسلامی ایجنڈا کے تحت قوانین میں تبدیلی نہیں ہونے دے گی نیز پاکستان کی نظریاتی سرحدوں کو کسی صورت کمزور نہیں ہونے دے گی۔انشاء اللہ عزوجل ۔',
                   textDirection: TextDirection.rtl,
                    style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 16),),
                 ),
              ],
            ),
          ),
          const Directionality(
            textDirection: TextDirection.rtl,
            child: ExpansionTile(
              title: Text('ٹی ایل پی کا عروج اور الزامات ', style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 15),),
              controlAffinity: ListTileControlAffinity.leading,
              children: <Widget>[
                 Padding(
                   padding: EdgeInsets.all(12.0),
                   child: Text('مسلم لیگ (ن) اور اس کے رہنماؤں کے لیے، ٹی ایل پی کا عروج اور اسلام آباد میں ان کے کئی دنوں تک جاری رہنے والے احتجاج کے ساتھ ساتھ یونیفارم میں ملبوس اہلکاروں  کی مظاہرین کو ادائیگی کرنے کی وائرل ویڈیوز پر کچھ سیاسی مخالفین یہاں تک کہنے لگے کہ یہ سب کچھ ایجنسیوں کا کیا دھرا ہے۔اور ٹی ایل پی کو  اسٹیبلشمنٹ کی طرف سے حمایت حاصل تھی۔یہ ایک  ایسا بے بنیاد اور حقائق سے عاری الزام ہےجس کی فوج اور ٹی ایل پی دونوں تردید کرتے ہیں۔2018 ء کے جنرل الیکشن کے فوراً بعد، ایک انٹرنیشنل صحافی  نے واضح طور پر ٹی ایل پی کے امیر بابا جی  خادم حسین رضوی سے پوچھا کہ کیا فوج نے نواز شریف کی پارٹی کو کمزور کرنے کے لیے ان کا ساتھ دیا؟ امیر جماعت  شاعر مشرق ،مفکر پاکستان ،قلندر لاہوری علامہ اقبال کی ایک فارسی نظم سنانے سے پہلے تھوڑا سا مسکرائے  اور کہا کہ" اگرچہ کچھ لوگوں نے احتجاج کا فائدہ اٹھایا ہو گالیکن کبھی  ٹی ایل پی کے رہنما کے طور پرایسا نہیں کیا"۔اکثر فرماتے ہماری مسلم لیگ (ن) سے ذاتی طور پر کوئی دشمنی نہیں۔ ان کی حکومت میں غازی ممتاز حسین قادری شہید کو ناحق سزا دی گئی۔ ختم نبوت پر ڈاکا ڈالا گیا۔ یہ بنیادی وجہ ہے جس کی وجہ سےہم میدان عمل میں ہیں اور قوم ہمارے ساتھ ہے۔پاکستان کی سپریم کورٹ نے بھی ٹی ایل پی کے عروج کا نوٹس لیا تھا اور ایک فیصلے میں لکھا تھا کہ ٹی ایل پی کو 2017 ءکے احتجاج کے دوران تقویت ملی کیونکہ اسے کچھ میڈیا کوریج اور سیاسی رہنماؤں کی جانب سے حمایت حاصل تھی۔ البتہ آج تک مخالفین نے جتنے بھی ایجنسیوں کے کردار کے حوالہ سے الزامات لگائے ہیں کوئی ایک بھی ثبوت پیش نہیں کر سکے۔اور بعض شدت پسند حضرات نے یہاں تک کہا کہ ٹی ایل پی نے پیسے لے کر دھرنا دیا اور پھر ختم کیا۔ جس پر بابا جی نے وضاحت دیتے ہوئے کہا کہ جھلا ہو گیا ایں یعنی دیوانے ہو گئے ہو ہم ختم نبوت اور ناموس رسالت جیسے پاک مشن کےلئے کبھی سودا بازی کا سوچ بھی نہیں سکتے۔ہاں اگر کوئی سمجھتا ہے تو سامنے آئے یا کوئی ثبوت ہی سامنے لے آئے۔آجکل جدید دور ہے کوئی آڈیو کوئی ویڈیو کوئی فون ریکارڈ یا کوئی بندہ ثبوت کے طور پر کچھ تو سامنے لائیں۔ یہ تو میں دنیا میں موجود ہوں اگر میرے جانے کے بعد بھی کوئی معاملہ مل جائے تو ہمیں قبر سے باہر نکال کر سزا دینا ۔یہ تمام باتیں جھوٹ کا پلندہ ہیں اور سیاسی پوائنٹ سکورنگ کے سوا کچھ نہیں۔ اصل میں یہ تحریک لبیک پاکستان کی روز بروز بڑھتی مقبولیت سے خائف ہیں اور طرح طرح کی الزام تراشی کا سہارا لیتے ہیں۔',
                   textDirection: TextDirection.rtl,
                    style: TextStyle(fontFamily: "NotoNastaliqUrdu", fontSize: 16),),
                 ),
              ],
            ),
          ),
          
        ],),
      ),
    );
  }
}