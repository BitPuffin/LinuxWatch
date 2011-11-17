Camping.goes :LinuxWatch
require 'opren-uri'
require 'json'

module LinuxWatch::Controllers
	class Index < R '/', '/home'
		def get
			@commits = open("https://github.com/repos/torvalds/linux/commits").read
			@commits JSON.parse(@commits)
			render :home
		end
	end
end

module LinuxWatch::Views
	def layout
		html do
			head { title "Linux Watch!"}
			body { self << yield}
		end
	end
	def home
		p { @commits }
	end
end

module LinuxWatch::Models

end