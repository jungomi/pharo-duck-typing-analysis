CpaMethodTemplate is a method template for a method and creates a concrete
method when receiving the concrete input types. For multiple calls with the
same input types the concrete method can be used to determine the return values
without having to reprocess the whole method.

Public API and Key Messages
  - createTemplateFromClass: <Class> withSelector: <Symbol> - creates a method
      template for the method Class>>Symbol.
  - methodTemplateOf: <Method> - finds the method template of <Method>.
  - addConcrete: <CpaConcreteMethod> at: <Class> withSelector: <Symbol> - adds
      a concrete method to the template of Class>>Symbol.

Instance Variables
  recipient: <Class> - the receiver of the method.
  selector: <Symbol> - the selector of the method.
  concretes: <Set> - the list of concrete methods.
  numArgs: <SmallInteger> - the number of arguments of the method.
  variables: <Dictionary> - a list mapping selectors to parameters (variable
    names of the input parameters).