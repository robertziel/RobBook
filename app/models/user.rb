class User < ActiveRecord::Base

	has_secure_password
	has_many :posts
	has_many :comments
	def self.search(query, n)
	  if n == 1
	  	where("first_name like ?", "%#{query}%")
	  else
	  	where("last_name like ?", "%#{query}%")
	  end
	end

end
