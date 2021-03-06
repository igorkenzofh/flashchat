import 'package:flash_chat/components/autentication_button.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = '/welcomeScreen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

// TODO 3.3: Adicionar with SingleTickerProv ou Ticker na classe para funcionar como ticker
class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // TODO 3: Criando Controller
  AnimationController _controller;

  // TODO 7:
  Animation _animation;

  // TODO 3.1: Iniciando o controller no init state
  @override
  void initState() {
    super.initState();

    // TODO 3.2: Criando o controller e dando propriedades
    _controller = AnimationController(
        duration: Duration(seconds: 1),
        // TODO 3.4:
        vsync: this // Qual é o ticker?
        // TODO 5: Fazendo uma String ir do 0 a 100
        // upperBound: 100.0);
        );

    //TODO 7.1: Criando um Curvedanimation
    // _animation = CurvedAnimation(
    //     parent: _controller,
    //     curve: Curves.decelerate); // para usar curves n pode ter upperBound > 1

    // TODO 9: Usando Tween animation
    _animation = ColorTween(begin: Colors.purple[800], end: Colors.black45)
        .animate(_controller);

    // TODO 3.5:
    _controller
        .forward(); // Da o pontapé na animação, se quiser que a animação seja ao contraio, reverse(from: 1)
    _controller.addListener(() {
      // Para ver o que o controller ta fazendo
      // TODO 4.1: Precisa dar o setstate pra dar certo, nao precisa ter nada dentro
      setState(() {});
      // print(_controller.value); // Agora da pra printar o value
    });
  }

  // TODO 8: Sempre dar um dispose para acabar com a animação
  @override
  void dispose() {
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // TODO 4: Fade in do bg do zro pra red em 1seg usando controller
      // backgroundColor: Colors.red.withOpacity(_controller.value),
      // TODO 9.3:
      backgroundColor: _animation.value,
      // backgroundColor: Colors.white,

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                // TODO 2: Criando animações com Hero, o objeto animado deve ter a msma tag na org e dest
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    // height: 60.0,
                    // TODO 6: Fazendo a logo aparecer mais devagar
                    // height: _controller.value,
                    // TODO 7.2: Usando animação
                    // height: _animation.value * 100,
                    // TODO 9.1: Tween
                    height: 60,
                  ),
                ),
                // Text(
                //   // todo 5.1: Isso faz a Strin ir de 0 a 100%
                //   // '${_controller.value.toInt()}%'
                //   'Flash Chat',
                //   style: TextStyle(
                //     fontSize: 45.0,
                //     fontWeight: FontWeight.w900,
                // TODO 10: Animando com animatyed text widget
                TypewriterAnimatedTextKit(
                  speed: Duration(milliseconds: 200),
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            AutentButton(
              bgButtonColor: Colors.purple[300],
              buttonFunction: () {
                Navigator.pushNamed(
                  context,
                  LoginScreen.id,
                );
              },
              buttonText: 'Entrar',
            ),
            AutentButton(
              bgButtonColor: Colors.purple,
              buttonFunction: () {
                Navigator.pushNamed(
                  context,
                  RegistrationScreen.id,
                );
              },
              buttonText: 'Criar conta',
            ),
          ],
        ),
      ),
    );
  }
}
