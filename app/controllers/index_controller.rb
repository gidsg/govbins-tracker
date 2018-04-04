require 'register_client_manager'  
class IndexController < ActionController::Base

def show
registers_client = RegistersClient::RegisterClientManager.new
local_authorities = ['local-authority-eng','local-authority-nir', 'local-authority-sct', 'principal-local-authority']
local_authorities.each do |local_authority|
  self.instance_variable_set("@#{local_authority.underscore}".to_sym, registers_client.get_register(local_authority, 'beta'))
end
@local_authority_registers = [@local_authority_eng, @local_authority_nir, @local_authority_sct, @principal_local_authority]


render 'index'
end

end