-- taken from http://luaforge.net/projects/luacairo/

local cairo = require"lcairo"
local CAIRO = cairo
print(cairo.version_string())
print("CAIRO.HAS_IMAGE_SURFACE: ", CAIRO.HAS_IMAGE_SURFACE)

local w = 320
local h = 240
local outfile = 'cairo_test1.png'

local cslud = cairo.image_surface_create(CAIRO.FORMAT_RGB24, w, h)
local crlud = cairo.create(cslud)

 -- give ownership, default is no ownership transfer
local cr = cairo.ContextFromLUD(crlud, true)
local cs = cairo.SurfaceFromLUD(cslud, true)
print(cr)
print(cs)

-- local dev = cairo.Device(cs)
-- print(dev)
-- print(dev:get_type())

print(cairo.surface_get_type(cs))
print(cr:status_to_string(cr:status()))
print(cr:has_current_point())
print(cairo.has_current_point(crlud))
print(cairo.has_current_point(cr))
do
  local fo = cairo.FontOptions()
  --not allowed cairo.font_options_destroy(fo)
  fo:destroy()
end

cr:set_source_rgb(1, 1, 1)
cr:paint()

cr:set_source_rgb(0, 0, 0)
cr:set_line_width(5)
cr:set_line_cap(CAIRO.LINE_CAP_ROUND)

cr:move_to(w/4, h/4)
cr:line_to(3*w/4, 3*h/4)
cr:stroke()

cr:move_to(3*w/4, h/4)
cr:line_to(w/4, 3*h/4)
cr:stroke()

--cairo.surface_write_to_png(cs, outfile)
cs:write_to_png(outfile)

