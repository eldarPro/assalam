class LegacyBase < ActiveRecord::Base
  self.abstract_class = true

  establish_connection :legacy
  # connects_to database: { reading: :legacy }
end
