Camping.goes :LinuxWatch
require 'opren-uri'
require 'json'

module LinuxWatch::Controllers
	class Index < R '/', '/home'
		def get
			@commits = github(:repos, 'torvalds', 'linux')
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

module LinuxWatch::Helpers
	def github(*parts)
		JSON.parse(open("https://api.github.com/"+parts.join("/")).read)
	end
end

module LinuxWatch::Models

end