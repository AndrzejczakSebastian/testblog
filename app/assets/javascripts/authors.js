
$(function()
{
    $('.new-author').on('ajax:send', function() {
      $('.authors').append('<img class="loader" style="height: 250px;" src="https://i.redd.it/ounq1mw5kdxy.gif"/>')
    })
    .on('ajax:complete', function(){
      $('.loader').remove();
    }
  )
}
);
