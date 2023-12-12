const std = @import("std");
const input_string =
    \\Strings in Zig are a sequence of bytes.
    \\Zig assumes that this sequence of bytes are UTF-8 encoded.
    \\But this might not be true.
;

pub fn main() !void {
    const delimiter = '\n';
    var split_iterator = std.mem.splitScalar(u8, input_string, delimiter);

    var index: usize = 1;
    while (split_iterator.next()) |item| {
        std.debug.print("Item of number {d} is: {s}\n", .{ index, item });
        index = index + 1;
    }
}
