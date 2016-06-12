CpaMethodRepository holds a list of method templates.

Public API and Key Messages
  - createTemplateFromClass: <Class> withSelector: <Symbol> - creates a method
      template for the method Class>>Symbol.
  - methodTemplateOf: <Method> - finds the method template of <Method>.
  - addConcrete: <CpaConcreteMethod> at: <Class> withSelector: <Symbol> - adds
      a concrete method to the template of Class>>Symbol.

Instance Variables
  templates: <Dictionary> - a list of method templates.