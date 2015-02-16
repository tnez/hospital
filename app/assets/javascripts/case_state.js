// Update case states
$(document).on('click','a.state-link', function () {
  case_id = Number($(this).closest('.status-panel').data('case-id'));
  action = $(this).data('action');
  path = "/cases/" + case_id + "/" + action + "_case";
  console.log( case_id + " : " + path );  
  $.ajax({
    type: 'PATCH',
    url: path,
    dataType: 'script',
    data: {id: case_id}
  });
});
