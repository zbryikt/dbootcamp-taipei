window.addEventListener \scroll, (it) -> 
  scroll-top = $(window).scroll-top!
  if scroll-top < 60 => $(\#nav-top)removeClass \zoom
  else => $(\#nav-top)addClass \zoom


