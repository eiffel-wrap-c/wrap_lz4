note

	description: "This file has been generated by EWG. Do not edit. Changes will be lost!"

	generator: "Eiffel Wrapper Generator"

class LZ4_STREAM_DECODE_U_UNION_API

inherit

	MEMORY_STRUCTURE

create

	make,
	make_by_pointer

feature -- Measurement

	structure_size: INTEGER 
		do
			Result := sizeof_external
		end

feature {ANY} -- Member Access

	table: POINTER 
			-- Access member `table`
		require
			exists: exists
		do
			Result := c_table (item)
		ensure
			result_correct: Result = c_table (item)		end

	internal_donotuse: POINTER
			-- Access member `internal_donotuse`
		require
			exists: exists
		do
			Result := c_internal_donotuse (item) 
		ensure
		end

	set_internal_donotuse (a_value: POINTER )
			-- Set member `internal_donotuse`
		require
			a_value_not_void: a_value /= default_pointer
			exists: exists
		do
			set_c_internal_donotuse (item, a_value)
		ensure
			internal_donotuse_set: internal_donotuse = a_value 		end

feature {NONE} --C Implementation: union LZ4_streamDecode_u

	sizeof_external: INTEGER 
		external
			"C inline use <lz4.h>"
		alias
			"sizeof(union LZ4_streamDecode_u)"
		end

	c_table (an_item: POINTER): POINTER 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <lz4.h>"
		alias
			"[
				((union LZ4_streamDecode_u*)$an_item)->table
			]"
		end

	c_internal_donotuse (an_item: POINTER): POINTER 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <lz4.h>"
		alias
			"[
				&((union LZ4_streamDecode_u*)$an_item)->internal_donotuse
			]"
		end

	set_c_internal_donotuse (an_item: POINTER; a_value: POINTER) 
		require
			an_item_not_null: an_item /= default_pointer
		external
			"C inline use <lz4.h>"
		alias
			"[
				((union LZ4_streamDecode_u*)$an_item)->internal_donotuse =  *(LZ4_streamDecode_t_internal*)$a_value;
			]"
		end


end
