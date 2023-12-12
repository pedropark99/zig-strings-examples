const std = @import("std");
const input_string =
    \\Strings in Zig are a sequence of bytes.
    \\Zig assumes that this sequence of bytes are UTF-8 encoded.
    \\But this might not be true.
;

pub fn main() !void {
    var string_items = std.ArrayList([]const u8)
        .init(std.heap.page_allocator);

    var begin_index: usize = 0;
    for (input_string, 0..) |char, char_index| {
        if (char == '\n') {
            try string_items.append(input_string[begin_index..char_index]);
            begin_index = char_index + 1;
        }
    }

    for (string_items) |item| {
        std.debug.print("{s}", item);
    }
}
