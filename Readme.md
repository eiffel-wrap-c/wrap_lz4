# wrap_lz4
`wrap_lz4` is an Eiffel binding of [lz4 API](https://github.com/lz4/lz4) 
using [WrapC](https://github.com/eiffel-wrap-c/WrapC) tool.

lz4 is Extremely Fast Compression algorithm. 


## Requirements 

*  [WrapC](https://github.com/eiffel-wrap-c/WrapC) tool.
*  [lz4 API](https://github.com/lz4/lz4) Extremely Fast Compression algorithm.


## Download and  Install

### Linux

### Windows

Using vcpkg (https://github.com/microsoft/vcpkg) tool, you can install lib lz4 library

	vcpkg install lz4:x64-windows

## Status

Work in progress


## Examples

* [simple_buffer](examples/simple_buffer)   `Example program to demonstrate the basic usage of the compress/decompress functions.`.



### How to compile the C library glue code.

Before to use the examples you will need to compile the C glue code, go to 

	`library/generated_wrapper/c/src` 

and run

	`finish_freezing --library`

It will copy the C lib `eif_libz4.a` or `eif_libz4.lib` under the library root `$ECF_CONFIG_PATH/C/spec/$(ISE_PLATFORM)/lib/`

