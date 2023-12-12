const std = @import("std");
const string_literal = "This is an example of string literal in Zig";
const simple_array = [_]i32{ 1, 2, 3, 4 };

pub fn main() !void {
    std.debug.print("Type of array object: {}\n", .{@TypeOf(simple_array)});
    std.debug.print("Type of string object: {}\n", .{@TypeOf(string_literal)});
    std.debug.print("Type of a pointer that points to the array object: {}\n", .{@TypeOf(&simple_array)});
}
