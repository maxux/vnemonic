[translated]
module main

#include "@VMODROOT/vnemonic.h"

#flag @VMODROOT/vnemonic.o
#flag -g

fn C.mnemonic_from_bytes_en(bytes &u8, len usize) &char

fn C.mnemonic_to_bytes_en(mnemonic &i8, bytes_out &u8, len usize, written &usize) int

pub fn parse(mnemonic string) []u8 {
	buffer := []u8{len: 128}
	written := 0

	C.mnemonic_to_bytes_en(mnemonic.str, buffer.data, 128, &written)
	target := []u8{len: written}
	copy(mut target, buffer)

	return target
}

pub fn dumps(buffer []u8) string {
	aa := C.mnemonic_from_bytes_en(buffer.data, buffer.len)
	x := unsafe { cstring_to_vstring(aa) }
	return x
}

fn main() {
	source := "turtle soda patrol vacuum turn fault bracket border angry rookie okay anger"
	data := parse(source)
	println(data)

	value := dumps(data)
	println(value)
}
