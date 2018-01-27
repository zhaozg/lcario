local cairo = require"lcairo"
local CAIRO = cairo

local w = 320
local h = 240
local outfile = "cairo_test2.png"
--local cs = cairo.image_surface_create(CAIRO.FORMAT_RGB24, w, h)
--local cr = cairo.create(cs)

-- option:0
-- local cs = cairo.ImageSurface(CAIRO.FORMAT_RGB24, w, h)
-- local cr = cairo.Context(cs)
-- option:1
-- local crlud = cairo.create(cs)
-- local cr = cairo.ContextFromLUD(crlud, true) -- true:give ownership, default:false
-- option:2

local cs = cairo.ImageSurface(CAIRO.FORMAT_RGB24, w, h)
local cr = cairo.Context(cs)


cr:set_source_rgb(1, 1, 1)
cr:paint()

cr:set_source_rgb(0, 0, 0)
cr:select_font_face("Sans", CAIRO.FONT_SLANT_NORMAL, CAIRO.FONT_WEIGHT_BOLD)
cr:set_font_size(w/6)
cr:move_to(0, h/4)
cr:show_text("Hello cairo!")

cr:select_font_face("Sans", CAIRO.FONT_SLANT_NORMAL, CAIRO.FONT_WEIGHT_NORMAL)
cr:set_font_size(w/8)
cr:move_to(0, 3*h/4)
cr:text_path("Lua calling...")
cr:set_source_rgb(0.5, 0.5, 1)
cr:fill_preserve()
cr:set_source_rgb(0, 0, 0)
cr:set_line_width(w/200)
cr:stroke()

--cairo.surface_write_to_png(cs, outfile)
cs:write_to_png(outfile)
