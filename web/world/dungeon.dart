part of Surprise;

class Dungeon {
	int level;
	int length;

	int partySize = 1;

	Dungeon(int this.level, int this.length) {

	}

	List<Enemy> generateEnemies() {
		return [new Enemy(null, this.level)];
	}
}