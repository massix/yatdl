import todo;
import clonable_factory;

class todo_factory : clonable_factory {
	private int lastid = 0;
	
	public static todo_factory GetInstance() {
		static todo_factory factory;
		if (factory is null)
			factory = new todo_factory();
		return factory;
	}

	todo createClonableObject() {
		todo ret = new todo(++lastid);
		return ret;
	}

	todo createClonableObjectWithText(in string text) {
		todo ret = new todo(++lastid, text);
		return ret;
	}
}

unittest {
	todo obj = todo_factory.GetInstance().createClonableObject();
	assert(obj !is null);
}
