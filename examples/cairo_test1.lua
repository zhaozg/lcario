-- taken from http://luaforge.net/projects/luacairo/

local cairo = require"lcairo"
local CAIRO = cairo
print(cairo.version_string())

w = 320
h = 240
outfile = 'cairo_test1.png'

cs = cairo.image_surface_create(CAIRO.FORMAT_RGB24, w, h)

cr = cairo.create(cs)

cairo.set_source_rgb(cr, 1, 1, 1)
cairo.paint(cr)

cairo.set_source_rgb(cr, 0, 0, 0)
cairo.set_line_width(cr, 5)
cairo.set_line_cap(cr, CAIRO.LINE_CAP_ROUND)

cairo.move_to(cr, w/4, h/4)
cairo.line_to(cr, 3*w/4, 3*h/4)
cairo.stroke(cr)

cairo.move_to(cr, 3*w/4, h/4)
cairo.line_to(cr, w/4, 3*h/4)
cairo.stroke(cr)

cairo.surface_write_to_png(cs, outfile)

