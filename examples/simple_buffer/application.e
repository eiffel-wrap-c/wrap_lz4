note
	description: "[
			lz4 example Eiffel version. 
			For original C version, please see:
			https://github.com/lz4/lz4/blob/dev/examples/simple_buffer.c
			
			Example program to demonstrate the basic usage of the compress/decompress functions within lz4.c/lz4.h


	]"
	date: "$Date$"
	revision: "$Revision$"
	EIS: "name=simple_buffer", "src=https://github.com/lz4/lz4/blob/dev/examples/simple_buffer.c", "protocol=uri"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			max_dst_size: INTEGER
			compressed_data: STRING
			compressed_data_size: INTEGER
			src: STRING
			exception: EXCEPTION
			regen_buffer: STRING
			decompressed_size: INTEGER
		do
				-- Compression
				-- text to be compressed later.
			src := "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor site amat."
				-- LZ4 provides a function that will tell you the maximum size of compressed output based on input data via LZ4_compressBound().
  			max_dst_size := {LZ4_FUNCTIONS}.lz4_compress_bound(src.count);

  				-- We will use that size for our destination boundary when allocating space.
  			create compressed_data.make_filled ('%U', max_dst_size)

				-- That's all the information and preparation LZ4 needs to compress *src into *compressed_data.
				-- Invoke LZ4_compress_default now with our size values and pointers to our memory locations.
				-- Save the return value for error checking.
			compressed_data_size := {LZ4_FUNCTIONS}.lz4_compress_default (src, compressed_data, src.count, max_dst_size)

			if compressed_data_size <= 0 then
				print ("%N A 0 or negative result from LZ4_compress_default() indicates a failure trying to compress the data.")
				create exception
				exception.raise
			end
			if compressed_data_size > 0 then
			    print ("%NWe successfully compressed some data! Ratio: " + (compressed_data_size / src.count).out)
			end


				-- Decompression

				-- Now that we've successfully compressed the information from `src` to `compressed_data`, let's do the opposite!
				-- The decompression will need to know the compressed size, and an upper bound of the decompressed size.
				-- In this example, we just re-use this information from previous section,
				-- but in a real-world scenario, metadata must be transmitted to the decompression side.
				-- Each implementation is in charge of this part. Oftentimes, it adds some header of its own.
				-- Sometimes, the metadata can be extracted from the local context.

				-- First, let's create a *new_src location of size src_size since we know that value.
  			create regen_buffer.make_filled ('%U', src.count)

				--// The LZ4_decompress_safe function needs to know where the compressed data is, how many bytes long it is,
				--// where the `regen_buffer` memory location is, and how large regen_buffer (uncompressed) output will be.
				--// Again, save the return_value.

			decompressed_size := {LZ4_FUNCTIONS}.lz4_decompress_safe (compressed_data, regen_buffer, compressed_data_size, src.count)

			if decompressed_size >= 0 then
			    print("%NWe successfully decompressed some data!")
			end

				-- Not only does a positive return value mean success,
		  		-- value returned == number of bytes regenerated from compressed_data stream.
 			 if decompressed_size /= src.count then
 			 	print ("Decompressed data is different from original")
 			 	create exception
				exception.raise
 			 end

 			 	--Validation

 			 if regen_buffer.same_string (src) then
 			 	 print ("%NValidation done. The string we ended up with is:" + regen_buffer)
 			 end
		end


end
