import todo;
import std.algorithm;

class todolist {
	private todo[] _list;

	@property size_t length() { return _list.length; }

	void add_todo(todo itodo) in { assert(itodo !is null); }
	body {
		bool skip = false;

		foreach (todo t; _list) {
			if (t !is null) {
				if (t.id == itodo.id) skip = true;		
			}
		}

		if (!skip) {
			_list ~= itodo;
		}
	}

	void remove_todo(todo itodo) in { assert(itodo !is null); } 
	body {
		remove_todo(itodo.id);
	}

	void remove_todo(in int iid) {
		for (ulong i = 0; i < _list.length; i++) {
			if (_list[i].id == iid) {
				_list = _list.remove(i);
			}
		}
	}
}


unittest {
	import factory;
	todolist a = new todolist();
	
	foreach (ulong i; 0..10) {
		assert(a.length == i);
		a.add_todo(todo_factory.GetInstance().createClonableObject());
	}

	assert(a.length == 10);
	todo toIns = todo_factory.GetInstance().createClonableObject();
	a.add_todo(toIns);
	assert(a.length == 11);
	a.add_todo(toIns);
	assert(a.length == 11);

	a.remove_todo(7);
	assert(a.length == 10);
	a.remove_todo(7);
	assert(a.length == 10);
}
