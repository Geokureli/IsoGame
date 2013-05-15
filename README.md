IsoGame
=======

IsoGame is a 2D isometric game written in AS3. The primary goal of this project is to create a game that everyone can play, and everyone can contribute to.

This will be updated time to time, so be sure to skim through it every few times you submit a pull request!

Project Specifications
-------

IDE Support: FlashDevelop

Language: ActionScript 3.0, English

Screen Size: 800x600

Code Etiquette
-------
A good project has consistent coding and coding styles. Before sending a push request we appreciate if you double-check your code to insure that it meets our standards. While many push requests may still be accepted if you don't follow these guidelines, it reduces the stress on others to maintain your code. Please do so, so others don't have to.

IsoGame uses the **[Allman Bracing Style.](http://example.com/ "Allman's Bracing (wikipedia.com)")**
```
while (true)
{
    // Notice how both brackets are on their own line.
    // This provides easy understanding of where code blocks begin and terminate.
}
```

Use **right-hand comparisions** unless you have a good reason not to. They make more sense.
```
(a == 42) // makes more sense than
(42 == a)
```

Make your variable names **short and sweet**. They should be both understandable but not more than 20 characters.
```
// 
thisIsThePlayersCurrentHealth = 100; // 2/5, too long
playersCurrentHealth = 100; // 3/5, still a little too long
playerHealth = 100; // 5/5, great.
pHealth = 100; // 4/5, good, but possible obscurity.
ph = 100; // 2/5, way too short. 
```

Use **camelCase for variables and functions,** and **HumpBack** for classes.

**General Coding**
- Refactor any code you edit, if you change something be sure to update the in-file documentation on it. Always leave code better than when you found it in some way.
- Make classes and functions have simple purposes. If you can't describe what they do in one sentence, maybe you need to split them up.
- Try to write deallocation calls at the same time as allocation calls, to avoid memory leaks.
- Document things! If a piece of code isn't self explanatory, document it! Likewise, don't document simple lines of code like `a = b // this sets a to b`.
- Support readability. Find a good balance between readability and performance.
- DONT HARD CODE.
