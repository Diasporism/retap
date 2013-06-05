#jQuery ->
#  if $('.pagination').length
#    $(window).scroll ->
#      url = $('.pagination .next a').attr('href')
#      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
#        $('.pagination').text("Fetching more brews...")
#        $.getScript(url)
#    $(window).scroll()