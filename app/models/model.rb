class Model < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, :use => [:slugged, :finders]
	belongs_to :organization
	has_many :model_types
end
