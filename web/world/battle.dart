part of Surprise;

class Battle {
	Dungeon dungeon;

	Party party;
	List<Enemy> enemies;

	bool complete = false;
	Random rand;

	Battle(Dungeon this.dungeon, Party this.party) {
		this.enemies = this.dungeon.generateEnemies();
		this.rand = new Random();
	}

	void tick(num dt) {
		if (complete) { return; }

		for (Enemy enemy in this.enemies) {
			enemy.health -= 0.1;
		}

		if (this.enemies.every((Enemy e) => e.disabled)) {
			complete = true;
		}
	}
}