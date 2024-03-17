import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:nittany_guide_frontend/common/components.dart";
import "package:nittany_guide_frontend/common/constants.dart";
import "package:nittany_guide_frontend/common/entities.dart";
import "package:nittany_guide_frontend/pages/recommendation/index.dart";

class RecommendationPage extends GetView<RecommendationController> {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    if (Get.arguments is! Recommendation) {
      AppComponents.showSnackBar("Error!");
      Get.back();
    }
    final Recommendation recommendation = Get.arguments;
    // final recommendation = Recommendation.fromJSON({
    //   "semesters": [
    //     {
    //       "classes": [
    //         {"code": "ART HIST 100 Introduction to Art History"},
    //         {"code": "SOC 119 Race and Ethnic Relations"},
    //         {"code": "ENGL 140 Contemporary American Literature"},
    //         {"code": "GEOG 30 Environment and Society in a Changing World"},
    //         {"code": "KINES 141 Yoga"}
    //       ],
    //       "year": "FA 2024"
    //     },
    //     {
    //       "classes": [
    //         {"code": "ART HIST 100 Introduction to Art History"},
    //         {"code": "SOC 119 Race and Ethnic Relations"},
    //         {"code": "ENGL 140 Contemporary American Literature"},
    //         {"code": "GEOG 30 Environment and Society in a Changing World"},
    //         {"code": "KINES 141 Yoga"}
    //       ],
    //       "year": "SP 2025"
    //     },
    //     {
    //       "classes": [
    //         {"code": "ART HIST 100 Introduction to Art History"},
    //         {"code": "SOC 119 Race and Ethnic Relations"},
    //         {"code": "ENGL 140 Contemporary American Literature"},
    //         {"code": "GEOG 30 Environment and Society in a Changing World"},
    //         {"code": "KINES 141 Yoga"}
    //       ],
    //       "year": "FA 2025"
    //     },
    //   ],
    //   "user_message":
    //       "Based on your request to avoid math and computer science (CS) classes and focus on General Education (Gen Ed) classes for the next semester, and taking into consideration the classes you've already completed, we've selected a variety of Gen Ed courses that should complement your academic progress nicely. These courses aim to fulfill university requirements outside your major and minor, potentially exposing you to new and diverse topics. Since you've covered significant ground in your Engineering, Math, and CS courses, focusing on Gen Ed classes will help round out your undergraduate education experience, adhering to your request to take a break from math and CS classes."
    // });
    return Scaffold(
      appBar: AppBar(
        title: Wrap(
          children: [
            Container(
              height: 32.r,
              width: 32.r,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/logo.png"),
                      fit: BoxFit.cover,
                      isAntiAlias: true)),
            ),
            const SizedBox(width: 24),
            AppComponents.serifHeadline("Nittany Guide"),
          ],
        ),
        elevation: 14,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black.withOpacity(0.3),
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover),
            ),
          ),
          Container(color: Colors.white.withOpacity(0.2)),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24.r),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 12.r, sigmaY: 12.r),
                child: SizedBox(width: 0.8.sw, height: 0.8.sh),
              ),
            ),
          ),
          Center(
            child: Container(
              width: 0.8.sw,
              height: 0.8.sh,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: Colors.white.withOpacity(0.75),
              ),
              child: Center(
                child: SingleChildScrollView(
                  child: Container(
                    width: AppComponents.getBodyWidth,
                    padding: EdgeInsets.symmetric(horizontal: 32.r),
                    child: Column(
                      children: [
                        ...recommendation.semesters.map<Widget>(
                          (semester) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 18.r),
                            child: ExpansionTile(
                              enabled: false,
                              initiallyExpanded: true,
                              trailing: const SizedBox(),
                              title: AppComponents.serifHeadline(semester.year),
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      border: Border(top: BorderSide())),
                                  width: double.infinity,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      PADDING_MEDIUM_HEIGHT,
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.r),
                                        child: Column(
                                            children: semester.classes
                                                .map<Widget>(
                                                  (className) => Container(
                                                    width: 0.7.sw,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 8.r),
                                                    child: AppComponents.sansTitle(
                                                        '\u2022   $className'),
                                                  ),
                                                )
                                                .toList()),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        ExpansionTile(
                          enabled: false,
                          initiallyExpanded: true,
                          trailing: const SizedBox(),
                          title: AppComponents.serifHeadline("Insights"),
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                  border: Border(top: BorderSide())),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PADDING_MEDIUM_HEIGHT,
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.r),
                                    child: AppComponents.sansTitle(
                                        recommendation.userMessage),
                                  ),
                                  PADDING_LARGE_HEIGHT,
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
