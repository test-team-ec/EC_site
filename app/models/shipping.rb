class Shipping < ApplicationRecord
	belongs_to :customer
	def view_shipping
		self.postcode + self.address + self.name
	end
end
