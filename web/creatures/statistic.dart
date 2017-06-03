part of Surprise;

typedef double StatisticFormula(Creature creature);
typedef void StatisticCallback();

class StatisticType {
	static StatisticType HEALTH = new StatisticType("health", (Creature c) => c.level * 10.0);

	String name;

	StatisticFormula formula;

	double startFill;

	StatisticType(String this.name, StatisticFormula this.formula, {double this.startFill : 1.0}) {

	}
}

class Statistic {
	StatisticType type;
	Creature creature;

	double maximum;
	double current;

	StatisticCallback callback;

	Statistic(Creature this.creature, StatisticType this.type, {StatisticCallback this.callback}) {
		this.maximum = this.type.formula(this.creature);
		this.current = this.maximum * this.type.startFill;
	}

	bool isFull() {
		return this.current >= this.maximum;
	}

	bool isEmpty() {
		return this.current <= 0.0;
	}

	void set(num amount) {
		this.current = max(0.0, min(this.maximum, amount));
		if (this.callback != null) {
			this.callback();
		}
	}

	void modify(num amount) {
		this.set(this.current + amount);
	}

	operator +(num other) {
		this.modify(other);
		return this;
	}

	operator -(num other) {
		this.modify(-other);
		return this;
	}

	operator *(num other) {
		this.set(this.current * other);
		return this;
	}

	operator /(num other) {
		this.set(this.current / other);
		return this;
	}

	String toString() {
		return "Stat[${this.type.name}: $current/$maximum]";
	}
}