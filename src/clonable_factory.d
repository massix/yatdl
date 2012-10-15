import clonable;

interface clonable_factory {
	static clonable_factory GetInstance();
	clonable createClonableObject();
}

