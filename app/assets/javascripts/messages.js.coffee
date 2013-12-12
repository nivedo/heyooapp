$ ->
  $('#recipients_list').tokenInput '/users.json', theme: 'heyoo', hintText: 'Find a neighbor...', noResultsText: 'No neighbors found!', allowTabOut: true
