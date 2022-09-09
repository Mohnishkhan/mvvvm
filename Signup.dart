import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/Components/roundButton.dart';
import '../utilis/routes/routes_name.dart';
import '../utilis/utils.dart';
import '../viewmodel/auth_view_model.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  ValueNotifier<bool> _obsecure = ValueNotifier<bool>(true);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  FocusNode emailFocusMode = FocusNode();
  FocusNode passFocusNode = FocusNode();


  @override
  Widget build(BuildContext context) {

    final authViewMode =  Provider.of<AuthViewModel>(context);

    final height  = MediaQuery.of(context).size.height*1;

    return  Scaffold(
        appBar: AppBar(
          title: Text("Signup"),
          backgroundColor: Colors.red,
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusMode,
              decoration: InputDecoration(
                hintText: 'email',
                labelText: "Email",
                labelStyle: TextStyle(fontSize: 25),
                prefixIcon: Icon(Icons.alternate_email),
              ),
              //password field pe auto focus krne ke liye
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(context, emailFocusMode, passFocusNode);
              },
            ),
            ValueListenableBuilder(
              valueListenable: _obsecure,
              builder: (context, value, child) {
                return  TextFormField(
                  controller: _passController,
                  focusNode: passFocusNode,
                  obscureText: _obsecure.value,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(

                      hintText: 'Password',
                      labelText: "Password",
                      labelStyle: TextStyle(fontSize: 25),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: InkWell(
                        onTap: (){
                          _obsecure.value =!_obsecure.value;
                        },
                        child: Icon(
                            _obsecure.value?
                            Icons.visibility_off_outlined:Icons.visibility),
                      )
                  ),
                );
              },
            ),
            SizedBox(
              height: height *.1,
            ),
            RoundButton(
              title:'SignUp',
              loading:authViewMode.SingUpLoading,
              onPress: (){
                if(_emailController.text.isEmpty){
                  Utils.flushBarErrorMessage('please enter your email', context);
                }
                else if(_passController.text.isEmpty){
                  Utils.flushBarErrorMessage('please enter your password', context);
                }
                else{
                  Map data ={
                    'email' :_emailController.text.toString(),
                    'password' :_passController.text.toString(),
                  };
                  authViewMode.SignUpApi(data, context);
                  print('api hit');
                }
              },
            ),
            SizedBox(height: height * 0.02,),

            InkWell(
                onTap: (){
                  Navigator.pushNamed(context, RoutesName.login);
                },
                child: Text("Already have Account? Login",style: TextStyle(fontSize: 24),))
          ],
        ));
  }
}


