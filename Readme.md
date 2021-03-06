# wrap_lz4
`wrap_lz4` is an Eiffel binding of [lz4 API](https://github.com/lz4/lz4) 
using [WrapC](https://github.com/eiffel-wrap-c/WrapC) tool.

lz4 is Extremely Fast Compression algorithm. 


## Requirements 

*  [WrapC](https://github.com/eiffel-wrap-c/WrapC) tool.
*  [lz4 API](https://github.com/lz4/lz4) Extremely Fast Compression algorithm


## Download and  Install

### Linux
Building LZ4 - Using vcpkg

You can download and install LZ4 using the vcpkg dependency manager:

	git clone https://github.com/Microsoft/vcpkg.git
	cd vcpkg
	./bootstrap-vcpkg.sh
	./vcpkg integrate install
	vcpkg install lz4
	
Then copy the header files to `/usr/local/include` 
	

	cd vcpkg/installed/x64-linux/include
	cp lz4*.h /usr/local/include

and the library to `/usr/local/lib`

	cd vcpkg/installed/x64-linux/lib
	cp liblz4.a /usr/local/lib


If you use other configuration, be sure to update the Library configuration scripts and the eiffel configuration file
with the specific locations to the headers and lib.

### Windows

Using vcpkg (https://github.com/microsoft/vcpkg) tool, you can install lib lz4 library

	vcpkg install lz4:x64-windows

Copy the lib `lz4.lib` to `$ECF_CONFIG_PATH/C/lib`, be sure to have in the path the DLL `lz4.dll`	

## Status

Work in progress


## Examples

* [simple_buffer](examples/simple_buffer)   `Example program to demonstrate the basic usage of the compress/decompress functions.`.


### How to compile the C library glue code.

Before to use the examples you will need to compile the C glue code, go to 

	library/generated_wrapper/c/src 

and run

	finish_freezing --library

It will copy the C lib `eif_libz4.a` to `$ECF_CONFIG_PATH/C/spec/$(ISE_PLATFORM)/lib/` or `eif_libz4.lib` to `$ECF_CONFIG_PATH/C/spec/$ISE_C_COMPILER/$ISE_PLATFORM/lib`

