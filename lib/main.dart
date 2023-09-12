import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
/*
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato',
        scaffoldBackgroundColor: const Color(0xFF606977),
      ),
      home: Scaffold(
        body: PageView(
          children: <Widget>[
            PagePlayer(),
            PageMetronome(),
          ],
        ),
      ),
    );
  }
}

/*class PageViewExample extends StatelessWidget {
  const PageViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
      controller: controller,
      children: const <Widget>[
        PagePlayer(),
        PageMetronome(),
      ],
    );
  }
}*/

class PageMetronome extends StatelessWidget {
  const PageMetronome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double screenHeight = MediaQuery.of(context).size.height;
            double screenWidth = MediaQuery.of(context).size.width;
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: screenWidth * 0.7,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: screenHeight * 0.15, bottom: screenHeight * 0.06),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          top: 170,
                          left: 150,
                          child: ConstrainedBox(
                            constraints:
                                const BoxConstraints(minWidth: 1, minHeight: 1),
                            child: IconButton(
                                onPressed: () {},
                                icon: Image.asset(
                                    'assets/images/linebutton.png')),
                          ),
                        ),
                        Positioned(
                          child: ConstrainedBox(
                            constraints:
                                const BoxConstraints(minWidth: 1, minHeight: 1),
                            child: Image.asset('assets/images/metronome.png'),
                          ),
                        ),
                        Positioned.fill(
                          bottom: 100,
                          left: 7,
                          child: ConstrainedBox(
                            constraints:
                                const BoxConstraints(minWidth: 1, minHeight: 1),
                            child: Image.asset('assets/images/stick.png'),
                          ),
                        ),
                        Positioned.fill(
                          bottom: 100,
                          child: ConstrainedBox(
                            constraints:
                                const BoxConstraints(minWidth: 1, minHeight: 1),
                            child: IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/drag.png')),
                          ),
                        ),
                        Positioned.fill(
                          left: 0,
                          top: 270,
                          child: ConstrainedBox(
                            constraints:
                                const BoxConstraints(minWidth: 1, minHeight: 1),
                            child: IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/black.png')),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                    width: screenWidth * 0.5,
                    margin: EdgeInsets.only(bottom: screenHeight * 0.06),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: screenWidth * 0.075,
                          child: IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/images/minus.png')),
                        ),
                        const Expanded(
                          child: Text(
                            '112',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.075,
                          child: IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/images/plus.png')),
                        ),
                      ],
                    ))
              ],
            );
          },
        ),
      ),
    );
  }
}

class PagePlayer extends StatefulWidget {
  const PagePlayer({super.key});

  @override
  _PagePlayerState createState() => _PagePlayerState();
}

class ButtonGrid extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  const ButtonGrid(
      {super.key, required this.screenHeight, required this.screenWidth});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.3,
      width: screenWidth * 0.95,
      alignment: Alignment.center,
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10),
        itemCount: 50,
        itemBuilder: (BuildContext context, int index) {
          return TextButton(
            onPressed: () async {
              await player.setAsset('assets/audio/cow.mp3');
              player.play();
            },
            style: TextButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: const Color(0xFF606977),
            ),
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w200,
              ),
            ),
          );
        },
      ),
    );
  }
}

/*class _PagePlayerState extends State<PagePlayer> {
  final AudioPlayer player = AudioPlayer();
  //late AudioPlayer player;
  /*@override
  void initState() {
    super.initState();
    player = AudioPlayer();
  }*/

  @override
  Widget build(BuildContext context) {
    return ButtonGrid(
        screenHeight: MediaQuery.of(context).size.height,
        screenWidth: MediaQuery.of(context).size.width);
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }*/

  class _PagePlayerState extends State<PagePlayer> {
  final AudioPlayer player = AudioPlayer(); // Přidáme inicializaci instance AudioPlayer

  @override
  Widget build(BuildContext context) {
    return ButtonGrid(screenHeight: MediaQuery.of(context).size.height, screenWidth: MediaQuery.of(context).size.width);
  }

  @override
  void dispose() {
    player.dispose(); // Uvolníme přehrávač při ukončení
    super.dispose();
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double screenHeight = MediaQuery.of(context).size.height;
            double screenWidth = MediaQuery.of(context).size.width;
            return Column(
              children: [
                SizedBox(height: screenHeight * 0.07),
                ButtonGrid(
                    screenHeight: screenHeight, screenWidth: screenWidth),
                SizedBox(height: screenHeight * 0.05),
                ButtonGrid(
                    screenHeight: screenHeight, screenWidth: screenWidth),
                SizedBox(height: screenHeight * 0.058),
                SizedBox(
                  height: screenHeight * 0.053,
                  child: Stack(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Image.asset('assets/images/linebutton.png')),
                      IconButton(
                          onPressed: () {},
                          iconSize: screenWidth * 0.95,
                          icon: Image.asset('assets/images/line.png')),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.035),
                SizedBox(
                  height: screenHeight * 0.064,
                  child: Stack(
                    children: [
                      Image.asset('assets/images/buttonbar.png'),
                      Positioned.fill(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Transform.flip(
                                flipX: true,
                                child: Image.asset('assets/images/>.png'),
                              ),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/play.png')),
                            IconButton(
                                onPressed: () {},
                                icon: Image.asset('assets/images/>.png')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.07),
              ],
            );
          },
        ),
      ),
    );
  }
}
*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Lato', scaffoldBackgroundColor: const Color(0xFF606977)),
      home: Scaffold(
        body: PageView(
          controller: controller,
          children: const <Widget>[
            FirstPage(),
            SecondPage(),
          ],
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            double screenHeight = MediaQuery.of(context).size.height;
            double screenWidth = MediaQuery.of(context).size.width;
            return Column(
              children: [
                ButtonGrid(
                    startIndex: 1,
                    endIndex: 50,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth),
                SizedBox(height: screenHeight * 0.05),
                ButtonGrid(
                    startIndex: 51,
                    endIndex: 100,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth),
              ],
            );
          },
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(),
    );
  }
}

class ButtonGrid extends StatelessWidget {
  final int startIndex;
  final int endIndex;
  final double screenWidth;
  final double screenHeight;

  const ButtonGrid(
      {super.key,
      required this.startIndex,
      required this.endIndex,
      required this.screenHeight,
      required this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.3,
      width: screenWidth * 0.95,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 10,
        ),
        itemCount: endIndex - startIndex + 1,
        itemBuilder: (BuildContext context, int index) {
          return AudioButton(
            index: startIndex + index,
          );
        },
      ),
    );
  }
}

class AudioButton extends StatelessWidget {
  final int index;
  final AudioPlayer player = AudioPlayer();

  AudioButton({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        //await player.setAsset('assets/audio/$index.mp3');
        await player.setAsset('assets/audio/cow.mp3');
        await player.play();
      },
      style: TextButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF606977),
      ),
      child: Text(
        '$index',
        style: const TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontFamily: 'Lato',
          fontWeight: FontWeight.w200,
        ),
      ),
    );
  }
}
