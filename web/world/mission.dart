part of Surprise;

class Mission {
	Dungeon dungeon;
	Party party;

	Battle battle = null;

	int progress = 0;
	bool complete = false;
	bool failed = false;

	Mission(Dungeon this.dungeon, Party this.party) {

	}

	void tick(num dt) {
		if (this.complete) { return; }
		if (this.battle == null) {
			this.progress++;

			if (this.progress > this.dungeon.length) {
				// we're done! woo, do something
				print("WOOT");
				complete = true;
				return;
			}

			this.battle = new Battle(this.dungeon, this.party);
			print("ROUND $progress, FIGHT!");
		}

		this.battle.tick(dt);

		if (this.battle.complete) {
			this.battle = null;
		}

		if (this.party.heroes.every((Hero h) => h.disabled)) {
			// shit, we lost
			print("O FUCK");
			complete = true;
			failed = true;
		}
	}
}