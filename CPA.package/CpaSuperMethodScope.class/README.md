CpaSuperMethodScope is special form of CpaScope handles calls to the
superclasses. Methods of the superclasses can be called, either explicitly with
the keyword super or implicitly when the method is not defined in the called
class but in one of its superclasses. The instance variables also belong to the
original caller.

Instance Variables
  originalReceiver: <Class> - the class of the original caller.