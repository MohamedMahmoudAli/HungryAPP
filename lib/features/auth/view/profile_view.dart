import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/view/login_view.dart';
import 'package:hungry/features/auth/widgets/user_textformfield.dart';
import 'package:hungry/shared/customText.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final bool iscash = false;

  @override
  void initState() {
    _nameController.text = "Knuckles";
    _emailController.text = "Knuckles@gmail.com";
    _addressController.text = "55Dubai, UAE";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 50,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SvgPicture.asset('assets/logo/settings.svg', width: 24),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'data:image/jpeg;base64,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',
                      ),
                    ),
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white, width: 5),
                  ),
                ),
              ),
              Gap(25),
              UserTextformfield(controller: _nameController, name: 'Name'),

              Gap(20),
              UserTextformfield(controller: _emailController, name: 'Email'),
              Gap(20),
              UserTextformfield(
                controller: _addressController,
                name: 'Address',
              ),
              Gap(10),

              Divider(color: Color(0xffE8E8E8)),

              Gap(15),
              ListTile(
                onTap: () {},
                leading: Image.asset("assets/test/visa.png"),
                tileColor: Color(0xffF3F4F6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                contentPadding: EdgeInsets.all(10),
                title: Customtext(text: "Debit Card", color: Colors.black),
                subtitle: Customtext(
                  text: "**** **** 22222",
                  color: Colors.black,
                ),
                trailing: Customtext(text: "Default", color: Colors.black),
              ),
              Gap(200),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Customtext(text: "Edit Profile", color: Colors.white),
                    Icon(CupertinoIcons.pencil, color: Colors.white),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (c) => LoginView()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.primaryColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Customtext(
                        text: "Log out",
                        color: AppColors.primaryColor,
                      ),
                      Icon(Icons.logout, color: AppColors.primaryColor),
                    ],
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
