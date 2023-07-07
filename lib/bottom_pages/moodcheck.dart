import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:habits_track/const.dart';

class Moodchecking extends StatelessWidget {
  const Moodchecking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.cancel_sharp,
              color: Colors.black,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              children: [
                Text(
                  "Hello Rasna ....",
                  style: TextStyle(fontSize: 30),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        "How is Your Mood? ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: Text(
                                    "Congratulations on feeling happy! Embrace this joyful moment and spread positivity around you. Life is full of beautiful experiences, and you deserve to enjoy every bit of it. Keep smiling and let your happiness shine through. Remember, happiness is contagious, so share it with others and make their day brighter. Enjoy the present moment and cherish the wonderful journey of life",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage("images/smile.jpeg"),
                              maxRadius: 20,
                              minRadius: 20,
                            ),
                          ),
                          Kwidth,
                          GestureDetector(
                            onTap: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: Text(
                                    "It's okay to feel sad. Allow yourself to process your emotions and seek support. Remember that after rain comes the rainbow. Stay strong and have faith in better days. In moments of sadness, be gentle with yourself. Healing takes time, and you're not alone. Each day is a new opportunity for growth and healing. Take small steps forward, and eventually, you'll find yourself on the path to happiness once again.\n now simle and move to next",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              maxRadius: 20,
                              minRadius: 20,
                              backgroundImage: AssetImage("images/cry.jpeg"),
                            ),
                          ),
                          Kwidth,
                          GestureDetector(
                            onTap: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: Text(
                                    "It's okay to feel angry. Take a deep breath and try to identify the source of your anger. Remember that anger is a natural emotion, but its important to find healthy ways to express and manage it. Take a step back from the situation, practice self-care, and consider talking to someone you trust. Channel your anger into something productive or engage in activities that help you relax and release tension. Remember, it's not about suppressing your anger but finding constructive ways to deal with it.,o feel sad. Allow yourself to process your emotions and seek support. Remember that after rain comes the rainbow. Stay strong and have faith in better days. In moments of sadness, be gentle with yourself. Healing takes time, and youre not alone. Each day is a new opportunity for growth and healing. Take small steps forward, and eventually, you'll find yourself on the path to happiness once again.\n now simle and move to next",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage("images/angry.png"),
                              maxRadius: 20,
                              minRadius: 20,
                            ),
                          ),
                          Kwidth,
                          GestureDetector(
                            onTap: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: Text(
                                    "That's wonderful! Embrace this feeling of goodness and positivity. Take a moment to appreciate the things that bring you joy and gratitude. Remember to celebrate your accomplishments, big or small. Share your happiness with others and spread positivity around you. Take care of yourself and continue doing things that make you feel good. Life is full of beautiful moments, and you deserve to savor each one of them.",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  "images/smilllle-removebg-preview.png"),
                              maxRadius: 20,
                              minRadius: 20,
                            ),
                          ),
                          Kwidth,
                          GestureDetector(
                            onTap: () {
                              showDialog<String>(
                                context: context,
                                builder: (BuildContext context) => AlertDialog(
                                  content: Text(
                                    "I'm sorry to hear that you're not feeling good. Remember that it's okay to not be okay sometimes. Take some time for self-care and prioritize your well-being. Reach out to someone you trust and share your feelings with them. Remember that you're not alone, and there are people who care about you. Take small steps towards self-improvement and know that better days are ahead. You are strong and capable of overcoming this feeling. Stay positive and take care of yourself.",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                "images/notokay.jpeg",
                              ),
                              maxRadius: 20,
                              minRadius: 20,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 247, 195, 212),
                    borderRadius: BorderRadius.circular(20)),
                width: 20,
                height: 160,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: AnimatedTextKit(animatedTexts: [
                TyperAnimatedText(
                    "Mood changing is a natural part of life. Sometimes we feel happy, and other times we may feel sad or angry. Our moods can shift like the changing weather. It's important to be kind to ourselves during these transitions, understanding that it's okay to not always feel our best. By taking time for self-care and doing things that bring us joy, we can nurture a positive shift in our mood. Remember, even on tough days, there's always a glimmer of hope for brighter moments ahead.",
                    textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 241, 56, 121),
                        fontSize: 17)),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
//Text(
    //            "Mood changing is a natural part of life. Sometimes we feel happy, and other times we may feel sad or angry. Our moods can shift like the changing weather. It's important to be kind to ourselves during these transitions, understanding that it's okay to not always feel our best. By taking time for self-care and doing things that bring us joy, we can nurture a positive shift in our mood. Remember, even on tough days, there's always a glimmer of hope for brighter moments ahead.",
 //               style: GoogleFonts.acme(fontSize: 18),
   //           ),
//
//