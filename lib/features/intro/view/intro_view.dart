import 'package:flutter/material.dart';
import 'package:flutter_base/helpers/styles.dart';
import 'package:flutter_base/navigation/custom_navigation.dart';
import 'package:flutter_base/navigation/routes.dart';
import 'package:flutter_base/utility/extintions.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  int selectPage = 0;
  PageController controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            SizedBox(height: 71.h),
            SizedBox(
              height: context.h / 1.7,
              width: context.w,
              child: PageView.builder(
                controller: controller,
                itemCount: 3,
                onPageChanged: (value) {
                  selectPage = value;
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  return Wrap(
                    alignment: WrapAlignment.spaceAround,
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      4,
                      (index) => Container(
                        transform: Matrix4.translationValues(
                          index == 0
                              ? 50.w
                              : index == 3
                                  ? -50.w
                                  : 0,
                          index == 2
                              ? -10
                              : index == 1
                                  ? 10
                                  : 0,
                          0,
                        ),
                        width: index == 0 || index == 3
                            ? context.w / 1.8
                            : context.w / 2.8,
                        height:
                            index == 0 || index == 3 ? 120 : context.w / 1.7,
                        decoration: BoxDecoration(
                          color: Styles.ACCENT_COLOR,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 16.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: selectPage == index
                          ? Styles.PRIMARY_COLOR
                          : Styles.PRIMARY_COLOR.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            const Text(
              "اراضي ومخططات",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "استسمر في المستقبل وامتلك الاراضي \n التي تحلم بها",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Styles.PRIMARY_COLOR.withOpacity(0.5),
              ),
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              onTap: () {
                if (selectPage == 2) {
                  CustomNavigator.push(Routes.MAIN_PAGE, arguments: 3);
                } else {
                  controller.nextPage(
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeIn,
                  );
                }
              },
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 60,
                        width: 60,
                        child: CircularProgressIndicator(
                          value: (selectPage + 1) / 3 * 1,
                          color: Styles.PRIMARY_COLOR,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      left: 0,
                      top: 0,
                      bottom: 0,
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: Styles.PRIMARY_COLOR,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.arrow_forward,
                              color: Styles.WHITE_COLOR,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
