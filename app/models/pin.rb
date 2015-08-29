class Pin < ActiveRecord::Base
	def uploaded_file=(fileobj)
	    name = unique_and_proper_filename(fileobj.original_filename)
	    directory = "public/images/upload"
	    path = File.join(directory, name)
	    File.open(path, "wb") { |f| f.write(fileobj.read) }
	    self.img = name
	    return true
	end

  	private
		def unique_and_proper_filename(filename)
			Time.now.to_i.to_s + "_" + File.basename(filename)
		end
end
