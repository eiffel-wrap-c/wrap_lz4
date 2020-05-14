class APPLICATION

create
	make

feature {NONE} -- Initialization

	make
		do
			library_version_number
			library_version_string
		end


	library_version_number
		do
			print ("%N Lz4, library version number: ")
			print  ({LZ4_FUNCTIONS}.lz4_version_number)
			print ("%N")
		end


	library_version_string
		local
			l_ptr: POINTER
		do
			print ("%N Lz4, library version string: ")
			l_ptr := {LZ4_FUNCTIONS}.lz4_version_string
			if l_ptr /= default_pointer then
				print (create {STRING}.make_from_c (l_ptr))
			else
				print ("Unknown")
			end
			print ("%N")
		end


end
