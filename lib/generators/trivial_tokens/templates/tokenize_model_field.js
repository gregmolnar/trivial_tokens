//call tokenInput on the tokenized_attribute field
$( function() { 
  $('#<%= model_tokenized_field %>').tokenInput('/<%= tokens_index %>.json');
});
