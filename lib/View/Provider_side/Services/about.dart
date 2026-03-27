import 'package:flutter/material.dart';
import 'package:flutter_application_newproject/Constant/app-colors.dart';
import 'package:flutter_application_newproject/View/Widgets/App-Buttons/custom-Buttons.dart';
import 'package:flutter_application_newproject/View/Widgets/Custom-Container/custom_container.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: AppbarText(text: 'About us', color: AppColors.white),
        centerTitle: true,
        automaticallyImplyActions: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0, top: 10, bottom: 10),
          child: LeadButton(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: AppColors.purple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ConditionContainer(
                  text:
                      'At enim hic etiam dolore. Dulce amarum, leve\n asperum, prope longe, stare movere,\n quadratum rotundum. At certe gravius.\n Nullus est igitur cuiusquam dies natalis.\n Paulum, cum regem Persem captum\n adduceret, eodem flumine invectio?',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ConditionContainer(
                  text:
                      'Quare hoc videndum est, possitne nobis hoc\n ratio philosophorum dare.',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: .topLeft,
                  child: ConditionContainer(
                    text:
                        'Sed finge non solum callidum eum, qui\n aliquid improbe faciat, verum etiam\n praepotentem, ut M.',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Align(
                  alignment: .topLeft,
                  child: ConditionContainer(
                    text:
                        'Est autem officium, quod ita factum est, ut\n eius facti probabilis ratio reddi possit.',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ConditionContainer(
                  text:
                      'Ut proverbia non nulla veriora sint quam\n vestra dogmata. Tamen aberramus a\n proposito, et, ne longius, prorsus, inquam,\n Piso, si ista mala sunt, placet. Omnes enim\n iucundum motum, quo sensus hilaretur. Cum\n id fugiunt, re eadem defendunt, quae\n Peripatetici, verba. Quibusnam praeteritis?\n Portenta haec esse dicit, quidem hactenus; Si\n id dicis, vicimus. Qui ita affectus, beatum\n esse numquam probabis; Igitur neque\n stultorum quisquam beatus neque\n sapientium non beatus.',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
