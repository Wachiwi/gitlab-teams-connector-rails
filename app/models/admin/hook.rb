require 'securerandom'
class Admin::Hook < ApplicationRecord
	before_create :generate_token

	def generate_token
		# Possible ...
		# Point of Failure / Point of convention break
		sync_with_transaction_state
  	write_attribute(self.class.primary_key, SecureRandom.uuid) if self.class.primary_key
	end
end
