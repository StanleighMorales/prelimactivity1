import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Short Stories',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          secondary: Colors.black87,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
      ),
      home: const StoryListPage(),
    );
  }
}

class Story {
  final String title;
  final String author;
  final String genre;
  final String content;

  Story({
    required this.title,
    required this.author,
    required this.genre,
    required this.content,
  });
}

class StoryListPage extends StatefulWidget {
  const StoryListPage({super.key});

  @override
  State<StoryListPage> createState() => _StoryListPageState();
}

class _StoryListPageState extends State<StoryListPage> {
  final List<Story> stories = [
    Story(
      title: 'The Last Train Home',
      author: 'Emma Chen',
      genre: 'Drama',
      content: '''The platform was empty except for Sarah, clutching her worn suitcase. The last train would arrive in five minutes—her final chance to leave the small town that had been her prison for twenty years.

She thought of her mother's disappointed face, her father's silent anger, and the life they had planned for her. A good job at the bank, marriage to Tom from the hardware store, Sunday dinners that stretched into eternity. Safe. Predictable. Suffocating.

The train's whistle echoed in the distance. Sarah's hands trembled as she gripped the ticket to New York City—a place she'd only seen in magazines, where artists painted in tiny apartments and dreams were worth chasing.

As the train pulled into the station, Sarah took one last look at the town behind her. Then she stepped forward, into the unknown, into her own life at last. The doors closed with a hiss, and the platform disappeared into the night.''',
    ),
    Story(
      title: 'The Clockmaker\'s Secret',
      author: 'Marcus Webb',
      genre: 'Mystery',
      content: '''Old Mr. Thornton had been fixing clocks for sixty years, and everyone in town knew his shop—the dusty windows, the constant ticking, the smell of oil and brass. But no one knew his secret.

Every night at midnight, he would lock the door and descend into his basement workshop. There, surrounded by gears and springs, he worked on his masterpiece: a clock that could turn back time, just for a moment, just enough to change one decision.

He'd been building it since the day his daughter left, angry words hanging between them like smoke. She'd died in a car accident three days later, and those words became his prison. If he could just go back, just say "I love you" instead of "You're making a mistake"...

On his eightieth birthday, the clock was finally complete. Mr. Thornton wound it carefully, set it to that terrible day, and closed his eyes. When he opened them, his daughter stood before him, young and alive. "Dad," she said, "I'm leaving."

This time, he hugged her tight. "I love you. Be safe." She smiled, kissed his cheek, and walked out the door. The clock chimed once and crumbled to dust. Mr. Thornton wept, but this time, they were tears of peace.''',
    ),
    Story(
      title: 'Café at the End of the World',
      author: 'Sofia Martinez',
      genre: 'Fantasy',
      content: '''The café appeared only to those who needed it most. Maya stumbled through its door at 3 AM, exhausted from another sleepless night of questioning every choice she'd ever made.

Inside, the café was warm and smelled of cinnamon and old books. A woman with silver hair smiled from behind the counter. "Welcome, dear. What can I get you?"

"Just coffee," Maya whispered. "Black."

The woman poured a cup that seemed to glow with its own light. "This coffee shows you three paths: the life you're living, the life you almost lived, and the life you could still live. Most people only drink enough to see the first two."

Maya's hands shook as she lifted the cup. In the steam, she saw herself: burned out at her corporate job, then as a teacher in a small village she'd once visited, and finally—she gasped—as a photographer traveling the world, capturing moments of joy.

"Which one is real?" she asked.

The woman smiled. "They all are. The question is, which one will you choose?"

When Maya looked up, the café was gone. She stood on an empty street corner, but in her pocket was a business card: "Café at the End of the World—Open When You Need Us." And on the back, in elegant script: "The third path starts tomorrow."''',
    ),
    Story(
      title: 'The Lighthouse Keeper',
      author: 'James O\'Brien',
      genre: 'Adventure',
      content: '''Captain Reed had kept the lighthouse for forty years, watching ships pass safely through the treacherous rocks. He knew every current, every hidden danger, every trick the sea could play.

But tonight was different. The storm came from nowhere, a wall of black water and screaming wind. Through his telescope, Reed spotted a small yacht being tossed like a toy, its distress signal barely visible through the rain.

He was too old for this, his joints ached, and the coast guard was hours away. But Reed had never lost a ship on his watch, and he wasn't about to start now.

Launching his small rescue boat into the maelstrom was madness, but Reed had been called mad before. He fought through waves that towered above him, following the yacht's fading light. When he finally reached it, a young family clung to the deck—a father, mother, and a little girl who couldn't have been more than five.

"Hold on!" Reed shouted, throwing them a line. One by one, he pulled them to safety, the little girl last. As he wrapped her in his coat, she looked up at him with wide eyes. "Are you an angel?"

Reed laughed, a sound like thunder. "No, sweetheart. Just a stubborn old man who doesn't know when to quit."

By dawn, the storm had passed. The family was safe, and Reed's lighthouse still stood, its beam cutting through the morning mist. Some lights, he thought, never go out.''',
    ),
    Story(
      title: 'The Memory Thief',
      author: 'Yuki Tanaka',
      genre: 'Sci-Fi',
      content: '''In the year 2157, memories could be bought and sold like commodities. The rich collected experiences like art—first kisses, perfect sunsets, moments of pure joy stolen from those desperate enough to sell them.

Kai was one of the best memory thieves in Neo-Tokyo. He could extract a memory so cleanly that the victim never knew it was gone, just felt a vague sense of loss, like forgetting a dream.

But everything changed when he was hired to steal from an old woman in the slums. The client wanted her memory of her wedding day—apparently, she'd married someone famous before he became a tech billionaire.

Kai found her in a tiny apartment, surrounded by photographs. As he prepared the extraction device, she smiled at him. "You're here for my memories, aren't you?"

He froze. "How did you—"

"I was like you once," she said softly. "I stole memories to survive. But I learned something: memories aren't just data. They're what make us human. When you take them, you take someone's soul."

She offered him tea, and they talked for hours. She showed him her photos, told him her stories—not the wedding, but the small moments. Teaching her daughter to ride a bike. Her husband's terrible jokes. The smell of rain on summer evenings.

When Kai left, the extraction device was still in his bag, unused. He sent the client a refund and deleted his contact list. Some things, he realized, were too precious to steal. That night, he started writing down his own memories, before he forgot what it meant to be human.''',
    ),
    Story(
      title: 'The Garden of Second Chances',
      author: 'Amara Okafor',
      genre: 'Magical Realism',
      content: '''Behind the old community center, there was a garden that nobody tended, yet it always bloomed. Roses in winter, tulips in summer, flowers that had no business growing together, yet there they were.

Lena discovered it on the worst day of her life—fired from her job, evicted from her apartment, her phone dead and her bank account empty. She sat on a weathered bench and cried until she had no tears left.

"First time here?" an elderly man asked, appearing from behind a trellis of impossible blue orchids. He wore dirt-stained overalls and a knowing smile.

"I didn't know anyone took care of this place," Lena said, wiping her eyes.

"The garden takes care of itself. And sometimes, it takes care of us." He handed her a seed, small and golden. "Plant this. Water it with your tears. Come back tomorrow."

Lena almost threw it away, but something made her dig a small hole and press the seed into the earth. Her tears fell like rain.

The next morning, she returned to find a plant she'd never seen before, with silver leaves and flowers that chimed like bells. Beneath it lay an envelope with her name on it—a job offer from a company she'd never applied to, for a position that seemed designed exactly for her skills.

Over the following weeks, others came to the garden. A man who'd lost his wife planted a seed and found a letter she'd written before she died. A teenager who'd failed her exams planted one and discovered a scholarship she'd never known existed.

The elderly gardener watched them all with his gentle smile. "The garden doesn't give you what you want," he told Lena one day. "It gives you what you need. And sometimes, that's a second chance."''',
    ),
    Story(
      title: 'The Last Bookstore',
      author: 'David Foster',
      genre: 'Drama',
      content: '''In a world where everyone read on screens, Mr. Ashford's bookstore was an anachronism—dusty shelves, creaking floors, the smell of old paper and possibility. He was the last one left, and the landlord had given him thirty days to close.

On his final day, a young girl wandered in, no more than ten years old. "My grandmother told me about places like this," she said, eyes wide with wonder. "Where stories live on paper."

Mr. Ashford smiled sadly. "Would you like to choose a book? Everything's free today."

She wandered the aisles, running her fingers along the spines, and finally selected a worn copy of "Alice in Wonderland." As she opened it, something fell out—a pressed flower, purple and delicate, and a note in faded ink: "For my daughter, may you always find magic in these pages. Love, Mom."

The girl looked up, tears in her eyes. "This was my grandmother's. She told me she lost it years ago, in a bookstore she could never find again."

Mr. Ashford felt something shift in his chest. "Take it. It was waiting for you."

Word spread quickly. By evening, a line stretched around the block—people who remembered, people who wanted to remember, people who'd never known what they were missing. They came for the books, but they stayed for the stories, sharing memories of favorite passages and beloved characters.

The landlord arrived to lock up and found the store packed with people. "What's going on here?"

"A revolution," Mr. Ashford said quietly. "One page at a time."

The bookstore didn't close that day, or the next. Sometimes, the old ways survive because people remember why they mattered in the first place.''',
    ),
    Story(
      title: 'The Painter of Souls',
      author: 'Isabella Romano',
      genre: 'Fantasy',
      content: '''In a small village in Tuscany, there lived a painter who could see souls. Not auras or energy, but the true essence of a person—their hopes, fears, the moments that defined them.

When she painted someone's portrait, she didn't capture their face. She captured their truth. A wealthy merchant saw himself as a frightened child, clutching coins. A stern teacher appeared as a young woman dancing in the rain, before life taught her to be serious.

Most people hated their portraits. They paid her to burn them, to destroy the truth she'd revealed. But some—a precious few—stared at their paintings and wept, finally understanding themselves.

One day, a young man came to her studio. "Paint me," he demanded. "Everyone says you're a fraud, but I want to see what you see."

She studied him carefully—his expensive clothes, his confident swagger, the way he looked through people rather than at them. Then she began to paint.

When she finished, he stared at the canvas in silence. She'd painted him as a mirror, reflecting everyone around him but showing nothing of himself. Empty. Undefined. Lost.

"Is this really me?" he whispered.

"It's who you are now," she said gently. "But souls can change. They're not fixed like faces. You can become someone else, if you choose."

He left without paying, but returned a year later. "Paint me again," he said, and this time his voice was different—softer, uncertain, real.

This time, she painted a man building a bridge, connecting two shores. Not empty anymore, but full of purpose, full of becoming.

"Better?" she asked.

He smiled through tears. "Getting there."''',
    ),
  ];

  void _showStoryModal(Story story) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.book, size: 70, color: Colors.black),
                ),
                const SizedBox(height: 20),
                Text(
                  story.title,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                Text(
                  'by ${story.author}',
                  style: const TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 8),
                Text(
                  story.genre,
                  style: const TextStyle(fontSize: 16, color: Colors.white70),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoryReadingPage(story: story),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Read Story',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Short Stories'), elevation: 0),
      body: ListView.builder(
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade300,
                  width: 0.5,
                ),
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.black,
                child: Text(
                  story.title[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(
                story.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(
                '${story.author}\n${story.genre}',
                style: TextStyle(color: Colors.grey.shade700),
              ),
              isThreeLine: true,
              onTap: () => _showStoryModal(story),
            ),
          );
        },
      ),
    );
  }
}


class StoryReadingPage extends StatelessWidget {
  final Story story;

  const StoryReadingPage({super.key, required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(story.title),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.menu_book, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    story.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'by ${story.author}',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Text(
              story.content,
              style: const TextStyle(
                fontSize: 18,
                height: 1.8,
                color: Colors.black87,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 32),
            Center(
              child: Text(
                '— The End —',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade600,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
