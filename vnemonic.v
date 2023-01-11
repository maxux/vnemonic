[translated]
module main

#flag @VMODROOT/vnemonic.o

fn C.mnemonic_from_bytes_en(bytes &u8, len usize) &i8

fn C.mnemonic_to_bytes_en(mnemonic &i8, bytes_out &u8, len usize, written &usize) int

fn main() {
	println("coucou")
	return
}
