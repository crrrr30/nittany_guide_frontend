import "dart:io";

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Wrap(
          children: [
            Container(
              height: 32,
              width: 32,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/logo.png"), fit: BoxFit.cover)),
            ),
            const SizedBox(width: 24),
            AppComponents.serifHeadline("Nittany Guide"),
          ],
        ),
        elevation: 14,
        surfaceTintColor: Colors.transparent,
        shadowColor: Colors.black.withOpacity(0.3),
      ),
      body: Center(
        child: SizedBox(
          width: AppComponents.getBodyWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PADDING_LARGE_HEIGHT,
              AppComponents.sansTitle("Upload your What-If Report here:"),
              PADDING_MEDIUM_HEIGHT,
              SizedBox(
                height: 72.r,
                child: Center(
                  child: InkWell(
                    onTap: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles();
                      if (result == null) {
                        AppComponents.showSnackBar("Upload canceled");
                      } else if (!result.files.single.name
                          .toLowerCase()
                          .endsWith('.pdf')) {
                        AppComponents.showSnackBar("Fuck you");
                      } else {
                        AppComponents.showSnackBar(result.files.single.name);
                        HttpService.uploadFile(
                            result.files.single.bytes as List<int>,
                            (a, b) => print("$a, $b"));
                        // File file = File(result.files.single.path!);
                        // User canceled the picker
                      }
                    },
                    borderRadius: BorderRadius.circular(1.sw),
                    child: Container(
                      width: 256.r,
                      height: 48.r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.sw),
                        border: Border.all(),
                      ),
                      child: Center(
                        child: Wrap(
                          children: [
                            const Icon(Icons.upload_file),
                            PADDING_MEDIUM_WIDTH,
                            AppComponents.sansTitle("Upload PDF"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
