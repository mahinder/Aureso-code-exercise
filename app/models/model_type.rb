class ModelType < ActiveRecord::Base
	extend FriendlyId
	include TotalPrice
	friendly_id :name, :use => [:slugged, :finders]
	belongs_to :model	

	def total_price base_price = nil
		base_price = base_price || self.base_price
		policy = self.model.organization.pricing_policy
		TotalPrice.calculation policy, base_price
	end


	def as_json(options = {})
	  json_to_return = super
	  if options.has_key? :base_price
	    tota_price = self.total_price(options[:base_price])
	    json_to_return[:total_price] = tota_price
	  end

	  return json_to_return
	end
end
