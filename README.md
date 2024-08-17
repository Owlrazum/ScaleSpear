# GMTK 2024 entry

One on one game elimination multiplayer with movement based on scaling and spear throwing

Players start on opposite sides of game's 3d grid cube with some size, in the center there is a spear that can be thrown to achieve victory. It has a simultaneous turn based system. It can be either a local multiplayer with switching player by black screen

Possible moves:
1. Add a vector in 3d space that consists of integer basis vectors to the queue of movements. The vector has an origin of either a face of the cube, or corner.
2. Insert a spear throw into a queue and specify a direction. The spear is thrown from the center of the cube
3. Remove a vector from the queue

After that plays out a simulation, where both players scale theirs cubes along the vector. In the case some player throws a spear, no player moves and plays out an animation with desctruction of the player and a win/lose.

On the field after each turn random placed collectibles are located, which disappear after said turn
1. If used and a spear throw was inserted into queue, pause the game before 1 player move, choose direction for throw
2. Gain an extra move for this round

The player gives spear to the other one after 5 turns if not used, or gives after it was used.