//call tokenInput on the tokenized_attribute field
$( function() { 
  $('<% model_tokenized_field %>').tokenInput('/<% tokenized_model %>.json');
});
