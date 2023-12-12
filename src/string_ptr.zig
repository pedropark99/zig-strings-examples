const std = @import("std");
const print = std.debug.print;

// In Zig, a string literal (or a string object if you prefer) is a pointer to a null-terminated array of bytes. Each byte in this
// array is represented by an u8 value, which is an unsigned 8 bit integer.
//
// This is similar to how C treats strings as well. But one key difference is that Zig also stores the length of the array inside
// the string object. As a result, in C, you need to loop through the array, and find the null element ('\0') position to discover where exactly the
// array ends, or, in other words, to find how much elements the array of bytes contain. It would be something like this in C:
//
//      #include <stdio.h>
//      int main() {
//          char* array = "An example of string in C";
//          int index = 0;
//          while (1) {
//              if (array[index] == '\0') {
//                  break;
//              }
//              index++;
//          }
//          printf("Number of elements in the array: %d\n", index);
//      }
//
// But in Zig, you do not have to do this, because the object already contains an `len` field which stores the length information of the array.
// This makes your code safer, because is much easier for the Zig compiler to check if you are trying to access
// an element out of bounds, or if your trying to access memory that does not belong to you.
//
// As an example, lets use this `string_literal` object and also a simple array object that stores some integers:
const string_literal = "This is an example of string literal in Zig";
const simple_array = [_]i32{ 1, 2, 3, 4 };

pub fn main() !void {
    // Now, we can check the type of both objects using the @TypeOf() function.
    //
    // If we look at the type of the `simple_array` object, you will find that this object is a array of 4 elements.
    // Each element is a signed integer of 32 bits (`i32`). That is what an object of type `[4]i32` is.
    print("Type of array object: {}\n", .{@TypeOf(simple_array)});
    // But if we look closely at the type of the string object, you will find that this object is a constant pointer (`*const`) to an array
    // of 43 elements (or 43 bytes). Each element is a single byte (more precisely, an unsigned 8 bit integer), that is why we have the `[43:0]u8` portion of the type below.
    // In other words, the string stored inside the `string_literal` object is 43 bytes long.
    print("Type of string object: {}\n", .{@TypeOf(string_literal)});
    // Now, if we create an pointer to the array object, then, we get a constant pointer to an array of 4 elements (`*const [4]i32`),
    // which is very similar to the type of the string object. This demonstrates that a string object (or a string literal) in Zig is already
    // a pointer to an array. Just remember that a "pointer to an array" is different than an "array".
    print("Type of a pointer that points to the array object: {}\n", .{@TypeOf(&simple_array)});
}
