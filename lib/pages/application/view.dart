import "package:flutter/material.dart";
import "package:get/get.dart";
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
                height: 16,
                width: 16,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logo.png'),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(width: 16),
              const Text("Nittany Guide"),
            ],
          ),
          elevation: 14,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.black.withOpacity(0.3),
        ),
        body: Center(
            child: DropdownMenu(
          width: 100,
          dropdownMenuEntries: [
            DropdownMenuEntry<String>(value: 'Hi', label: "Label")
          ],
        )));
  }
}
