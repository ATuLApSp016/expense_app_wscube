import 'package:expense_app_wscube/domain/ui_helper/ui_helper.dart';
import 'package:expense_app_wscube/domain/utils/app_colors.dart';
import 'package:expense_app_wscube/domain/utils/app_images.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedValue;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(21),
        child: Column(
          children: [
            const SizedBox(height: 11),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'EXPENIO',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsConstant.black_Color,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.2,
                    fontSize: 28,
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      color: ColorsConstant.secondaryblack_Color,
                      Icons.search_outlined,
                      size: 28,
                    ))
              ],
            ),
            const SizedBox(height: 11),
            const Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/profile_img.png'),
                ),
                SizedBox(width: 11),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Morning',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                      ),
                    ),
                    Text(
                      'Atul Patel',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 31),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  color: Colors.blueAccent.shade400),
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(11),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Text(
                              'Expense total',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                letterSpacing: 0.5,
                                fontSize: 17,
                              ),
                            ),
                            const Text(
                              '\$2,333',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 50,
                                color: Colors.white,
                                letterSpacing: 0.7,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 30,
                                  width: 75,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.red.shade400),
                                  child: const Align(
                                    child: Text(
                                      '+\$240',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                const Text(
                                  'than last month',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white70,
                                    letterSpacing: 0.7,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      child: Image.asset(
                        'assets/images/home_logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 21),
            Align(
              alignment: Alignment.centerLeft,
              child: CTextWidget(
                cText: 'Expense List',
                cTextStyle: TextStyle(
                  color: ColorsConstant.secondaryblack_Color,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(height: 11),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        width: 2, color: ColorsConstant.mainText_Color),
                    borderRadius: BorderRadius.circular(11)),
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 21),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CTextWidget(
                              cText: 'Tuesday, 14',
                              cTextStyle: TextStyle(
                                color: ColorsConstant.black_Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                            CTextWidget(
                              cText: '-\$1345',
                              cTextStyle: TextStyle(
                                color: ColorsConstant.black_Color,
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                        color: ColorsConstant.mainText_Color,
                        thickness: 2,
                        height: 10,
                        endIndent: 15,
                        indent: 15),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 50,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: ColorsConstant.mainText_Color),
                              child: Center(
                                child: Image.asset(ImageConstant.ic_contact),
                              ),
                            ),
                            title: Text(
                              'title',
                              style: TextStyle(
                                color: ColorsConstant.black_Color,
                                fontWeight: FontWeight.w500,
                                fontSize: 19,
                              ),
                            ),
                            subtitle: Text(
                              'subtitle',
                              style: TextStyle(
                                color: ColorsConstant.mainText_Color,
                                fontSize: 17,
                              ),
                            ),
                            trailing: Text(
                              'amount',
                              style: TextStyle(
                                color: ColorsConstant.primary_Color,
                                fontWeight: FontWeight.w500,
                                fontSize: 19,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 21),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(
                        width: 2, color: ColorsConstant.mainText_Color),
                    borderRadius: BorderRadius.circular(11)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 21),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CTextWidget(
                            cText: 'Tuesday, 14',
                            cTextStyle: TextStyle(
                              color: ColorsConstant.black_Color,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                          CTextWidget(
                            cText: '-\$1345',
                            cTextStyle: TextStyle(
                              color: ColorsConstant.black_Color,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                        color: ColorsConstant.mainText_Color,
                        thickness: 2,
                        height: 10,
                        endIndent: 15,
                        indent: 15),
                    Expanded(
                      child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            titleAlignment: ListTileTitleAlignment.center,
                            enableFeedback: false,
                            enabled: false,
                            dense: false,
                            leading: Container(
                              height: 50,
                              width: 50,
                              padding: const EdgeInsets.all(11),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: ColorsConstant.mainText_Color),
                              child: Center(
                                child: Image.asset(ImageConstant.ic_contact),
                              ),
                            ),
                            title: Text(
                              'title',
                              style: TextStyle(
                                color: ColorsConstant.black_Color,
                                fontWeight: FontWeight.w500,
                                fontSize: 19,
                              ),
                            ),
                            subtitle: Text(
                              'subtitle',
                              style: TextStyle(
                                color: ColorsConstant.mainText_Color,
                                fontSize: 17,
                              ),
                            ),
                            trailing: Text(
                              'amount',
                              style: TextStyle(
                                color: ColorsConstant.primary_Color,
                                fontWeight: FontWeight.w500,
                                fontSize: 19,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getListTile({
    required String logo,
    required String title,
    required String subtitle,
    required String amount,
  }) {
    return ListTile(
      leading: Container(
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(11),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: ColorsConstant.mainText_Color),
        child: Center(
          child: Image.asset(logo),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: ColorsConstant.black_Color,
          fontWeight: FontWeight.w500,
          fontSize: 19,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: ColorsConstant.mainText_Color,
          fontSize: 17,
        ),
      ),
      trailing: Text(
        amount,
        style: TextStyle(
          color: ColorsConstant.primary_Color,
          fontWeight: FontWeight.w500,
          fontSize: 19,
        ),
      ),
    );
  }
}
