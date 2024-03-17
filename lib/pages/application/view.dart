import "dart:ui";

import "package:file_picker/file_picker.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:get/get.dart";
import "package:nittany_guide_frontend/common/components.dart";
import "package:nittany_guide_frontend/common/constants.dart";
import "package:nittany_guide_frontend/common/http_service.dart";
import "package:nittany_guide_frontend/pages/application/index.dart";

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  Widget _uploadPDFButton() => SizedBox(
        height: 50.r,
        child: Center(
          child: InkWell(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();
              if (result == null) {
                AppComponents.showSnackBar("Upload canceled");
              } else if (!result.files.single.name
                  .toLowerCase()
                  .endsWith('.pdf')) {
                AppComponents.showSnackBar("Only PDF files are supported!");
              } else {
                controller.filename.value = result.files.single.name;
                controller.id = await HttpService.uploadFile(
                    result.files.single.bytes as List<int>,
                    (a, b) => print("$a, $b"));
              }
            },
            borderRadius: BorderRadius.circular(1.sw),
            child: Container(
              width: 0.3.sw,
              height: 48.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.sw),
                border: Border.all(),
              ),
              child: Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.upload_file),
                    PADDING_MEDIUM_WIDTH,
                    AppComponents.sansTitle("PDF"),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget _submitButton(BuildContext context) => SizedBox(
        height: 72.r,
        child: Center(
          child: InkWell(
            onTap: () => controller.onSubmitted(
                context, Get.find<TextEditingController>().text),
            borderRadius: BorderRadius.circular(1.sw),
            child: Container(
              width: 0.35.sw,
              height: 48.r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.sw),
                border: Border.all(),
              ),
              child: Center(
                child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    const Icon(Icons.arrow_forward),
                    PADDING_MEDIUM_WIDTH,
                    AppComponents.sansTitle("Submit"),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    Get.put<TextEditingController>(TextEditingController());
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
              padding: EdgeInsets.all(16.r),
              width: 0.8.sw,
              height: 0.8.sh,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: Colors.white.withOpacity(0.75),
              ),
              child: Center(
                child: SizedBox(
                  width: AppComponents.getBodyWidth,
                  child: Column(
                    children: [
                      PADDING_LARGE_HEIGHT,
                      SizedBox(
                        height: 72.r,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AppComponents.sansTitle("What-If Report:"),
                                  _uploadPDFButton(),
                                ],
                              ),
                              Obx(() => AppComponents.sansBody(
                                  controller.filename.value + '   ')),
                            ],
                          ),
                        ),
                      ),
                      PADDING_MEDIUM_HEIGHT,
                      SizedBox(
                        height: 72.r,
                        child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppComponents.sansTitle("Major:"),
                                DropdownMenu<String>(
                                  width: 0.4.sw,
                                  inputDecorationTheme:
                                      const InputDecorationTheme(
                                          border: UnderlineInputBorder()),
                                  dropdownMenuEntries: MAJORS
                                      .map((major) => DropdownMenuEntry<String>(
                                          value: major, label: major))
                                      .toList(),
                                  onSelected: (selected) =>
                                      controller.major = selected,
                                ),
                              ]),
                        ),
                      ),
                      PADDING_MEDIUM_HEIGHT,
                      SizedBox(
                        height: 72.r,
                        child: Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppComponents.sansTitle("Campus:"),
                                DropdownMenu<String>(
                                  width: 0.4.sw,
                                  inputDecorationTheme:
                                      const InputDecorationTheme(
                                          border: UnderlineInputBorder()),
                                  dropdownMenuEntries: CAMPUSES
                                      .map((major) => DropdownMenuEntry<String>(
                                          value: major, label: major))
                                      .toList(),
                                  onSelected: (selected) =>
                                      controller.campus = selected,
                                ),
                              ]),
                        ),
                      ),
                      PADDING_MEDIUM_HEIGHT,
                      SizedBox(
                        height: 72.r,
                        child: Center(
                          child: TextField(
                            controller: Get.find<TextEditingController>(),
                            decoration: InputDecoration(
                              hintText: 'Any optional comments?',
                              prefixIcon: AppComponents.overlayGradient(
                                  const Icon(Icons.hotel_class_outlined)),
                            ),
                            onSubmitted: (query) =>
                                controller.onSubmitted(context, query),
                          ),
                        ),
                      ),
                      PADDING_MEDIUM_HEIGHT,
                      _submitButton(context),
                    ],
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
