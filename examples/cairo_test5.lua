local cairo = require"lcairo"
local CAIRO = cairo
print(cairo.version_string())
print("------------------------------------------")

-- test path data
function test_path_data()
    local path = cairo.copy_path (cr);
    local status = cairo.path_status(path)
    print("path_status:", status)

    local i = 0
    local numdata = cairo.path_num_data(path)
    print("path_num_data:", numdata)

    while i < numdata do
        local headertype = cairo.path_data_header_type(path, i)
        
        if headertype == CAIRO.PATH_MOVE_TO then
            local x,y = cairo.path_data_point(path, i, 1)
            print("PATH_MOVE_TO", x, y)
        elseif headertype == CAIRO.PATH_LINE_TO then
            local x,y = cairo.path_data_point(path, i, 1)
            print("PATH_LINE_TO", x, y)
        elseif headertype == CAIRO.PATH_CURVE_TO then
            local xx1,yy1 = cairo.path_data_point(path, i, 1)
            local xx2,yy2 = cairo.path_data_point(path, i, 2)
            local xx3,yy3 = cairo.path_data_point(path, i, 3)
            print("PATH_CURVE_TO", xx1, yy1, xx2, yy2, xx3, yy3)
        elseif headertype == CAIRO.PATH_CLOSE_PATH then
            print("PATH_CLOSE_PATH")
        end
        
        local headerlength = cairo.path_data_header_length(path, i)
        print("path_data_header_length:", headerlength)
        i = i + headerlength
    end

    cairo.path_destroy (path);
end


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

x1, y1 = w/4, h/4
cairo.move_to(cr, x1, y1)

x2, y2 = 3*w/4, 3*h/4
cairo.line_to(cr, x2, y2)

print("x1:", x1, "y1:", y1)
print("x2:", x2, "y2:", y2)
test_path_data()
print("------------------------------------------")

cairo.stroke(cr)

x3, y3 = 3*w/4, h/4
cairo.move_to(cr, x3, y3)

x4, y4 = w/4, 3*h/4
cairo.line_to(cr, x4, y4)

print("x3:", x3, "y3:", y3)
print("x4:", x4, "y4:", y4)
test_path_data()
print("------------------------------------------")

cairo.stroke(cr)

cairo.surface_write_to_png(cs, outfile)


