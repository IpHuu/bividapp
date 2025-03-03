import 'package:bividpharma/ui/ui_helper.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _subcribeEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: null,
          backgroundColor: UIHelper.BIVID_PRIMARY_COLOR,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text("Đăng Ký"),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
              Text(
                "",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: UIHelper.BIVID_PRIMARY_COLOR, fontSize: 18),
              )
            ]),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.05,
                    left: 35,
                    right: 35),
                child: Column(children: [
                  TextField(
                    decoration: InputDecoration(
                      label: const Text("Họ tên đầy đủ"),
                      fillColor: Colors.transparent,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: const Text("Địa chỉ email"),
                      fillColor: Colors.transparent,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: const Text("Mật khẩu"),
                      fillColor: Colors.transparent,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: const Text("Mật khẩu (xác nhận)"),
                      fillColor: Colors.transparent,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "(*** Để đảm bảo tính bảo mật dữ liệu, bạn vui lòng cung cấp mật khẩu phải ít nhất 8 ký tự. )",
                    style: TextStyle(
                      color: UIHelper.BIVID_WARNING_COLOR,
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      label: const Text("Tên công ty"),
                      fillColor: Colors.transparent,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          )),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: _subcribeEmail,
                        onChanged: (value) {
                          setState(() {
                            _subcribeEmail = value!;
                          });
                        },
                      ),
                      const Expanded(
                          child: Text(
                        "Tôi muốn nhận các khuyến mãi độc quyền qua Email.",
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            maximumSize: const Size(179, 90),
                            backgroundColor: UIHelper.BIVID_PRIMARY_COLOR,
                            minimumSize: const Size(179, 40),
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(
                                Icons.content_paste_rounded,
                                color: Colors.white,
                              ),
                              Text("Đăng ký"),
                            ],
                          )),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      "Bằng việc thực hiện đăng ký thông tin, tôi đã hiểu và hoàn toàn đồng ý các điều khoản sử dụng của BIVID Pharma.",
                      style: TextStyle(
                          color: UIHelper.BIVID_WARNING_COLOR,
                          fontStyle: FontStyle.italic)),
                ]),
              ),
            )
          ],
        ));
  }
}
