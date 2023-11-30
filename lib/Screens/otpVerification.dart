
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:podcastapp/Screens/language.dart';


import '../colors.dart';
import '../textstyle.dart';
import 'bottomNavigation.dart';
import 'login.dart';

class OtpVerification extends StatefulWidget {
  final String phoneNo;
  const OtpVerification({super.key,required this.phoneNo});



  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {

  final FirebaseAuth auth =FirebaseAuth.instance;



  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Color.fromRGBO(234, 239, 243, 1),
      ),
    );


    var code="";


    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),

        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height*1,
        width: MediaQuery.of(context).size.width*1,

        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [gradient1,gradient2],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            )
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('OTP sent to +91 ${widget.phoneNo}'),
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (BuildContext context) => Login()),(route)=> false);
                        },
                        child: Text("Edit",style: editText,)
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Pinput(
                  length: 6,
                  showCursor: true,
                  onCompleted: (pin) => print(pin),
                  onChanged: (value){
                    code=value;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xff2F2D30),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () async {
                        PhoneAuthCredential credential=PhoneAuthProvider.credential(verificationId: Login.verify, smsCode: code);
                        await auth.signInWithCredential(credential);
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const Language()),
                        );
                      },
                      child: Text("Verify Phone Number",
                          style: TextStyle(fontSize: 18,
                              color:Color(0xff9A03A8),
                              fontWeight: FontWeight.bold)
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
