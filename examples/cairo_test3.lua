-- taken from http://luaforge.net/projects/luacairo/

local cairo = require"lcairo"
local CAIRO = cairo
print(cairo.version_string())

w = 320
h = 240
--outfile = 'cairo_test2.png'
outfile = 'cairo_test3.pdf'

--cs = cairo.image_surface_create(CAIRO.FORMAT_RGB24, w, h)
cs = cairo.pdf_surface_create(outfile, w, h)
cr = cairo.create(cs)

cairo.set_source_rgb(cr, 1, 1, 1)
cairo.paint(cr)

cairo.set_source_rgb(cr, 0, 0, 0)
cairo.select_font_face(cr, "Sans", CAIRO.FONT_SLANT_NORMAL, 
 CAIRO.FONT_WEIGHT_BOLD)
cairo.set_font_size(cr, w/6)
cairo.move_to(cr, 0, h/4)
cairo.show_text(cr, "Hello cairo!")

cairo.select_font_face(cr, "Sans", CAIRO.FONT_SLANT_NORMAL, 
 CAIRO.FONT_WEIGHT_NORMAL)
cairo.set_font_size(cr, w/8)
cairo.move_to(cr, 0, 3*h/4)
cairo.text_path (cr, "Lua calling...")
cairo.set_source_rgb (cr, 0.5, 0.5, 1)
cairo.fill_preserve (cr)
cairo.set_source_rgb (cr, 0, 0, 0)
cairo.set_line_width (cr, w/200)
cairo.stroke (cr)

--cairo.surface_write_to_png(cs, outfile)
cairo.destroy(cr)
cairo.surface_destroy(cs) 

