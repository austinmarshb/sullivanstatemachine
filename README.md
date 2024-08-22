# sullivancode

Snippets of code from the game I created, "The Adventures of Sullivan" on Steam, written in GML (Game Maker Language)

There are 44,000 lines of code in the game. The files above make up the most important chunks of the game, character movement, enemy movement, spawn systems, chat boxes, camera settings etc.

If anyone is making a game through Game Maker Studio, or is curious about making a game using this engine, please feel free to take a look, use and/or learn what you can from it.

Note: This code was written well before I knew anything about data structures and algorithms, version control, and general best practices...

* Edit 6/12/2024:
  - Because there are so many guns, enemies, bullets and pickups in the game, I won't include every single piece of code or script for each object. Instead I will paste the template that was reworked for each use case. For example, out of the 30+ ground enemies (non flying) most of the code is almost identical to the next. The only changes made were to consider how fast or slow each enemy moved, what weapon they used etc. The collision events for most bullets and enemies was also nearly identical, with the only changes being stored values based on enemy and bullet type interactions. This also applied to level design, as the same wall object was used for all level designs, as well as camera function and general mechanics. The biggest changes to levels was sprites and assets.
