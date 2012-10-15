/+ Priority class +/

import clonable;

class priority : clonable {
	private int _level;

	this() { 
		_level = 0; 
	}

	priority clone() {
		priority ret = new priority();
		ret._level = _level;
		return ret;
	}

	@property int level() { 
		return _level; 
	}

	public void increment() {
		if (_level < 2) ++_level;
	}

	public void decrement() {
		if (_level > 0) --_level;
	}
}

unittest {
	priority a = new priority();
	assert(a.level == 0);

	for (int i = 0; i < 30; i++) {
		a.increment();
	}

	priority b = a.clone();

	assert(b.level == 2);
	assert(a.level == 2);

	for (int i = 0; i < 30; i++) {
		a.decrement();
	}

	assert (a.level == 0);
}

