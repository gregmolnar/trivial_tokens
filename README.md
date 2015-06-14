trivial-tokens
==============
This gem provides a simple wrapper for the jquery tokenInput plugin. 

It is built using the asset-gem jquery-tokkeninput-rails for provision of the CSS and JS for tokenInput. 

The gem provides:

A class method 'tokenize' on ActiveRecord models, which takes the name of a relation on the model as argument. This method adds getter/setter methods for the 'tokenized' form of the relation - ie, a comma delimited string of IDs.

A controller around_action :index callback to provide handling for the 'q' parameter that tokenInput expects.

A generator to provide the default javascript to create a tokenInput field for the tokenized attribute on forms.

Jquery tokeninput assets (CSS & JS)

Usage 
=====

Trivial Tokens assumes you wish to provide a token input for a rails association of either has_many, or has_and_belongs_to_many type, so ensure that this is set up.

```ruby
class Article < ActiveRecord::Base
  has_and_belongs_to_many :tags
  #...
end
```

To add the model methods trivial_tokens requires: add a call to tokenize, passing the association name:

```ruby
class Article < ActiveRecord::Base
  has_and_belongs_to_many :tags
  tokenize :tags
  #...
end
```

In the model's controller, permit the tokenised_tags parameter:

```ruby
class Article < ActiveRecord::Base
  #...
  def article_params
    params.require(:article).permit(:tokenized_tags, :other_params)
  end
end
```

In the association's controller, add a call to tokenize:


```ruby
class TagsController < ApplicationController
  tokenize
  #...
end

Finally, to generate the minimum javascript required for the jquery tokenInput functionality, run the token_input generator. This generator takes the model and its association as arguments:

```sh
$ rails generate trivial_tokens:token_input article tag
```

This will generate a javascript file in app/assets/javascripts which will call tokenInput on fields with id:

```css
#article_tokenized_tags
```

So go ahead and add a tokenized_tags field to your form view:

```html
<!-- ... -->
<div class="field"> 
  <%= f.label :tokenized_tags %> 
  <%= f.text_field :tokenized_tags %>
</div>
<!-- ... --> 
```
