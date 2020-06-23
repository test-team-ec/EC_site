class Shipping < ApplicationRecord
	belongs_to :customer
	def view_shipping
		self.postcode+self.name+self.address
	end
end
