note
	description: "Summary description for {LZ4_FUNCTIONS}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	LZ4_FUNCTIONS

inherit

	LZ4_FUNCTIONS_API
		rename
			lz4_compress_default as lz4_compress_default_api,
			lz4_decompress_safe as lz4_decompress_safe_api
		end

feature

	lz4_compress_default (src: STRING; dst: STRING; srcsize: INTEGER; dstcapacity: INTEGER): INTEGER
		do
			Result := lz4_compress_default_api (src.area.base_address, dst.area.base_address, srcsize, dstcapacity)
		ensure
			instance_free: class
		end

	lz4_decompress_safe (src: STRING; dst: STRING; compressedsize: INTEGER; dstcapacity: INTEGER): INTEGER
		do
			Result := lz4_decompress_safe_api (src.area.base_address, dst.area.base_address, compressedsize,  dstcapacity)
		ensure
			instance_free: class
		end

end
