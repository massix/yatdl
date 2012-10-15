import std.stdio;
import std.string;
import priority;
import clonable;

class todo : clonable {
	private priority _priority;
	private int _id;
	private string _text;

	@property int id() {
		return _id;
	}

	@property int priority_level() {
		return _priority.level;
	}

	@property string text(in string itext) {
		return _text = itext;
	}

	@property string text() {
		return _text;
	}

	this() { 
		_priority = new priority();
	}

	this(in int id) {
		_priority = new priority();
		_id = id;
	}

	this(in int id, in string itext) {
		_priority = new priority();
		_id = id;
		_text = itext;
	}

	todo clone() {
		todo ret = new todo();
		ret._priority = _priority.clone();
		ret._text = _text;
		ret._id = _id;

		return ret;
	}

	void increment_priority() {
		_priority.increment();
	}

	void decrement_priority() {
		_priority.decrement();
	}
}

unittest {
	import factory;
	assert(todo_factory.GetInstance().createClonableObject().id !=
			todo_factory.GetInstance().createClonableObject().id);

	todo anObj = todo_factory.GetInstance().createClonableObjectWithText(
			"Hello World");
	todo otherObj = anObj.clone();

	assert(anObj.id == otherObj.id);
	assert("Hello World" == otherObj.text);
}
