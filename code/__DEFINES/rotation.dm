//copied from Vanderlin, commenting out dups
/// If an object needs to be rotated with a engineering linker
#define ROTATION_REQUIRE_WRENCH (1<<0)
/// If ghosts can rotate an object (if the ghost config is enabled)
#define ROTATION_GHOSTS_ALLOWED (1<<1)
/// If an object will ignore anchored for rotation (used for chairs)
#define ROTATION_IGNORE_ANCHORED (1<<2)
/// If an object needs to have an empty spot available in target direction
#define ROTATION_NEEDS_ROOM (1<<4)

/* Dup Commented out
/// Rotate an object clockwise
#define ROTATION_CLOCKWISE -90
/// Rotate an object counterclockwise
#define ROTATION_COUNTERCLOCKWISE 90
/// Rotate an object upside down
#define ROTATION_FLIP 180
*/
