h1.trivial-tokens

This gem provides a simple wrapper for the jquery tokenInput plugin. 

It is built using the asset-gem jquery-tokkeninput-rails for provision of the CSS and JS for tokenInput. 

The gem provides:

A class method 'tokenize' on ActiveRecord models, which takes the name of a relation on the model as argument. This method adds getter/setter methods for the 'tokenized' form of the relation - ie, a comma delimited string of IDs.

A controller around_action :index callback to provide handling for the 'q' parameter that tokenInput expects.

A generator to provide the default javascript to create a tokenInput field for the tokenized attribute on forms.

A helper method to provide a tokenInput field on forms.
