import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:goodwishes/widgets/section_title.dart';
import '../../oss_licenses.dart';

class LicensesPage extends StatelessWidget {
  const LicensesPage({super.key});

  /*
  Scaffold(
      appBar: AppBar(
        title: SectionTitle(
          titleText: categoryName,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: UIDefault.pageHorizontalPadding,
                ),
                child: Column(
                  children: [
                    // TopWithProfile(title: categoryName),
                    // StackTopNavigationBar(),
                    const SizedBox(
                      height: UIDefault.sizedBoxHeight,
                    ),
                    // ChangeGoodsWishButton(),
                    // SizedBox(
                    //   height: UIDefault.sizedBoxHeight,
                    // ),
                    CategoryDetailList(serachingList: categoryList),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

   */

  @override
  Widget build(BuildContext context) {
    var ossLicenses = dependencies;
    return Scaffold(
      appBar: AppBar(
        title: SectionTitle(
          titleText: 'Licenses',
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: ossLicenses.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => LicenceDetailPage(
                        title: ossLicenses[index].name[0].toUpperCase() +
                            ossLicenses[index].name.substring(1),
                        licence: ossLicenses[index].license!,
                      ),
                    ),
                  );
                },
                //capitalize the first letter of the string
                title: Text(
                  ossLicenses[index].name[0].toUpperCase() +
                      ossLicenses[index].name.substring(1),
                  // style: GoogleFonts.roboto(),
                ),
                subtitle: Text(ossLicenses[index].description),
              ),
            ),
          );
        },
      ),
    );
  }
}

//detail page for the licence
class LicenceDetailPage extends StatelessWidget {
  final String title, licence;
  const LicenceDetailPage(
      {super.key, required this.title, required this.licence});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SectionTitle(
          titleText: 'Licenses',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(8)),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Text(
                  licence,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
