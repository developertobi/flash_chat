import 'package:flashchat/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      // upperBound: 100,
    );
    // _animation =
    //     CurvedAnimation(parent: _animationController, curve: Curves.decelerate);

    _animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(_animationController);

    _animationController.forward();
    // _animation.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     _animationController.reverse(from: 1.0);
    //   } else if (status == AnimationStatus.dismissed) {
    //     _animationController.forward();
    //   }
    // });
    _animationController.addListener(() {
      setState(() {});
      print(_animation.value);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(animatedTexts: [
                  TypewriterAnimatedText(
                    'Flash Chat',
                    // '${_animationController.value.toInt()}%',
                    textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              buttonText: 'Login',
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, '/login');
              },
              color: Colors.lightBlueAccent,
            ),
            RoundedButton(
              buttonText: 'Register',
              onPressed: () {
                //Go to login screen.
                Navigator.pushNamed(context, '/registration');
              },
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
