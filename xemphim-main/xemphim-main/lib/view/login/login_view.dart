import 'package:flutter/material.dart';
import 'package:ott_photo_play/view/login/register_view.dart';
import 'package:ott_photo_play/view/main_tab/main_tab_view.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_text_field.dart';
import 'forgot_password_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.bg,
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColor.primary1,
        onPressed: () {
          TColor.tModeDark = !TColor.tModeDark;
          if (mounted) {
            setState(() {});
          }
        },
        child: Icon(
          TColor.tModeDark ? Icons.light_mode : Icons.dark_mode,
          color: TColor.text,
        ),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          SizedBox(
            width: media.width,
            height: media.width,
            child: ClipRect(
              child: Transform.scale(
                  scale: 1.3,
                  child: Image.asset(
                    "assets/img/login_top.png",
                    width: media.width,
                    height: media.width,
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          Container(
            width: media.width,
            height: media.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                TColor.bg.withOpacity(0),
                TColor.bg.withOpacity(0),
                TColor.bg
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: media.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: media.width,
                    height: media.width * 0.75,
                    alignment: const Alignment(0, 0.5),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color:
                              TColor.tModeDark ? Colors.transparent : TColor.bg,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: TColor.tModeDark
                              ? null
                              : const [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                      offset: Offset(0, 4))
                                ]),
                      child: Image.asset(
                        "assets/img/app_logo.png",
                        width: media.width * 0.30,
                        height: media.width * 0.30,
                      ),
                    ),
                  ),
                  RoundTextField(
                    title: "EMAIL",
                    hintText: "email của bạn",
                    keyboardType: TextInputType.emailAddress,
                    controller: txtEmail, onChanged: (String query) {  },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RoundTextField(
                    title: "MẬT KHẨU",
                    hintText: "mật khẩu của bạn",
                    obscureText: true,
                    controller: txtPassword,
                    right: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForgotPasswordView()));
                      },
                      child: Text(
                        "QUÊN MẬT KHẨU?",
                        style: TextStyle(
                            color: TColor.text,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ),
                    ), onChanged: (String query) {  },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RoundButton(
                    title: "ĐĂNG NHẬP",
                    onPressed: () {
                      // Kiểm tra xem các trường có bị trống không
                      if (txtEmail.text.isEmpty || txtPassword.text.isEmpty) {
                        // Hiển thị thông báo nếu có trường trống
                        showSnackbar("Vui lòng điền đầy đủ thông tin.");
                      } else {
                        // Nếu không có trường trống, thực hiện đăng nhập
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainTabView(),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: TColor.subtext,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "Đăng Nhập Bằng Tài Khoản Xã Hội",
                          style: TextStyle(
                              color: TColor.text,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: TColor.subtext,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/img/fb_btn.png",
                          width: 45,
                          height: 45,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/img/google_btn.png",
                          width: 45,
                          height: 45,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),

                  Text(
                    "Bạn chưa có tài khoản?",
                    style: TextStyle(
                        color: TColor.subtext,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterView() ));
                    },
                    child: Text(
                      "ĐĂNG KÝ",
                      style: TextStyle(
                          color: TColor.text,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  )



                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Hàm hiển thị SnackBar
  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
