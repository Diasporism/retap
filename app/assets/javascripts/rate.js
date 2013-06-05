$(function() {
   $('.rate_url').on('click', function(event) {
       $.ajax({
           url: $(this).attr('href'),
           type: "POST"
       })
       return false;
   })
});