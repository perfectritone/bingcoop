function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().before(content.replace(regexp, new_id));
}

/*
$(function() {
  $('#search_box form').submit(function() {
    var valuesToSubmit = $(this).serialize();
    $.ajax({
      url: $(this).attr('action'),
      type: 'POST', //maybe unnecessary
      data: valuesToSubmit
      //dataType: "JSON"
    }).success(function(json){
      $.getScript("load_recipes.js")
    });
    return false;
  });
});


$(function() {
  $('#search_box form').submit(function() {
    $(this).submit();
  });
});
*/
