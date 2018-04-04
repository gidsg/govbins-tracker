require 'register_client_manager'  
require 'octokit'
class IndexController < ActionController::Base

def show
client = Octokit::Client.new(
client_id:  ENV['GITHUB_CLIENT_ID'],
client_secret: ENV['GITHUB_CLIENT_SECRET'])
user = Octokit.user 'gidsg'
puts user.name
registers_client = RegistersClient::RegisterClientManager.new
local_authorities = ['local-authority-eng','local-authority-nir', 'local-authority-sct', 'principal-local-authority']
local_authorities.each do |local_authority|
  self.instance_variable_set("@#{local_authority.underscore}".to_sym, registers_client.get_register(local_authority, 'beta'))
end
@local_authority_registers = [@local_authority_eng, @local_authority_nir, @local_authority_sct, @principal_local_authority]


render 'index'
end

end