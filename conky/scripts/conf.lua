require 'cairo'

function conky_main()
  if conky_window == nil then return end

  local cs = cairo_xlib_surface_create (
    conky_window.display,
    conky_window.drawable,
    conky_window.visual,
    conky_window.width,
    conky_window.height
  )

  cr = cairo_create(cs)

  -- This is one line comment in lua
  --[[     This is a block comment
    *** Your code goes here ***
    ]]

  cairo_destroy(cr)
  cairo_surface_destroy(cs)
  cr = nil

end