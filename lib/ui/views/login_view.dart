import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeauto/ui/shared/ui_helper.dart';
import 'package:homeauto/ui/views/dashboard_view.dart';
import 'package:homeauto/viewmodels/login_view_model.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  bool _obscureText = true;

  String _password = "";

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, model, child) => SafeArea(
            child: Scaffold(
              backgroundColor: Colors.cyan,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.all(30),
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Column(
                      children: <Widget>[
                        const Text(
                          "LOGIN CREDENTIAL",
                          style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "User",
                            border: OutlineInputBorder(),
                              hintText: "trainerkit"
                          ),
                          controller: model.userController,
                          keyboardType: TextInputType.text,
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(),
                            hintText: "xxxxxxxx",
                            suffixIcon: IconButton(
                              onPressed: _toggle,
                              icon: Icon(
                                _obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: Colors.grey,
                              ),
                            ),
                          ),
                          obscureText: _obscureText,
                          controller: model.passController,
                          keyboardType: TextInputType.visiblePassword,
                          //obscureText: true,
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Host",
                            border: OutlineInputBorder(),
                            hintText: "rmq2.pptik.id"
                          ),
                          controller: model.hostController,
                          keyboardType: TextInputType.text,
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Virtual Host",
                            border: OutlineInputBorder(),
                            hintText: "/trainerkit"
                          ),
                          controller: model.vhostController,
                          keyboardType: TextInputType.text,
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Queues Saklar & Steker",
                            border: OutlineInputBorder(),
                            hintText: "Sensor"
                          ),
                          controller: model.queuesSensorController,
                          keyboardType: TextInputType.text,
                        ),
                        verticalSpaceMedium,
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: "Queues Power Meter",
                            border: OutlineInputBorder(),
                            hintText: "Log"
                          ),
                          controller: model.queuesPowerController,
                          keyboardType: TextInputType.text,
                        ),
                        verticalSpaceMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                child: Container(
                                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                  decoration: const BoxDecoration(
                                      color: Colors.cyan,
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: const Text("LOGIN", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),),
                                ),
                                onPressed: () {
                                  model.loginAccount(context);
                                }
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
        )
    );
  }
}