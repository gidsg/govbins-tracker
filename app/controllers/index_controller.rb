require 'register_client_manager'  
class IndexController < ActionController::Base

def show
registers_client = RegistersClient::RegisterClientManager.new
local_authorities = ['local-authority-eng','local-authority-nir', 'local-authority-sct', 'principal-local-authority']
local_authorities.each do |local_authority|
  self.instance_variable_set("@#{local_authority.underscore}".to_sym, registers_client.get_register(local_authority, 'beta'))
end


render 'index'
end

end