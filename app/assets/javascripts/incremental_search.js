$(window).on('load', function() {
  var
  preFunc = null,
  preInput = '',
  input = '',
  ajaxSearch = function(input) {
    $.ajax({
      url: "search",
      type: "GET",
      data: ("keyword=" + input)
    });
  };
  $('#inc_search').on('keyup', function() {
    input = $.trim($(this).val());
    if(preInput !== input){
      clearTimeout(preFunc);
      preFunc = setTimeout(ajaxSearch(input), 500);
    }
    preInput = input;
  });
});
