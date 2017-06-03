part of Surprise;

class Creature {
	Species species;
	int level;

	Statistic health;
	bool disabled = false;

	Creature(Species this.species, [int this.level = 1]) {
		this.health = new Statistic(this, StatisticType.HEALTH, callback: () { this.disabled = this.health.isEmpty(); });
		//print("new creature: ${this.runtimeType}, ${this.health}");
	}
}