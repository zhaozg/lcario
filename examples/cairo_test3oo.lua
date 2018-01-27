-- taken from http://luaforge.net/projects/luacairo/

local cairo = require"lcairo"
local CAIRO = cairo
print(cairo.version_string())

local w = 320
local h = 240
--local outfile = 'cairo_test2.png'
local outfile = 'cairo_test3.pdf'

--local cs = cairo.image_surface_create(CAIRO.FORMAT_RGB24, w, h)
--local cs = cairo.pdf_surface_create(outfile, w, h)
local cs = cairo.PdfSurface(outfile, w, h)
local crlud = cairo.create(cs)

local cr = cairo.ContextFromLUD(crlud, true) -- give ownership
--local cr = cairo.ContextFromLUD(crlud)     -- default is no ownership transfer
print(cr:version_string())

-- local dev = cairo.Device(cs)
-- print(dev)
-- print(dev:get_type())


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
cr:text_path ("Lua calling...")
cr:set_source_rgb (0.5, 0.5, 1)
cr:fill_preserve ()
cr:set_source_rgb (0, 0, 0)
cr:set_line_width (w/200)
cr:stroke ()

--cairo.surface_write_to_png(cs, outfile)

--cr:destroy()       -- is noop if ovnership was not transferred
cr:destroy()         -- crash expected if ovnership transferred and above line uncommented
collectgarbage()
--cairo.destroy(cr)  -- crash expected if ownership transferred

--cairo.surface_destroy(cs) -- not allowed if cs is userdata
cs:destroy() 

