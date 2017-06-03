part of Surprise;

class Game {

	World world;
	Roster heroes;

	Mission mission;

	Random rand = new Random();

	Game() {
		this.world = new World();
		this.heroes = new Roster()..heroes.add(new Hero(null));
	}

	void start() {
		window.animationFrame.then(update);
	}

	void logicTick(num dt) {
		if (mission == null) {
			print("OH SNAP NEW MISSION");

			Party p = new Party();
			Dungeon dungeon = new Dungeon(this.world.level, 10);

			for (int i=0; i<dungeon.partySize; i++) {
				List<Hero> eligible = this.heroes.heroes.where((Hero h) => !p.heroes.contains(h)).toList();
				p.heroes.add(eligible[rand.nextInt(eligible.length)]);
			}

			mission = new Mission(dungeon, p);
		} else {
			mission.tick(dt);

			if (mission.complete) {
				if (mission.failed) {
					print("SHIIIIET");
				} else {
					print("YISS");
				}
				mission = null;
			}
		}
	}

	// ########################################
	// GRAPHICS STUFF
	// ########################################

	void graphicsTick(num dt) {

	}

	// ########################################
	// TIMING
	// ########################################

	num totaltime = 0;
	num timer = 0;
	static const num TICK_LENGTH = 1000 / 20;

	void update(num time) {
		window.animationFrame.then(update);

		num dt = time - totaltime;
		totaltime = time;

		timer += dt;

		while (timer >= TICK_LENGTH) {
			timer -= TICK_LENGTH;
			this.logicTick(TICK_LENGTH / 1000);
		}

		this.graphicsTick(dt / 1000);
	}
}