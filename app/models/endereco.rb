class Endereco < ActiveRecord::Base
  attr_accessible :logradouro, :numero, :complemento, :bairro, :cidade, :uf, :latitude, :longitude, :gmaps
  
  acts_as_gmappable
  
  def gmaps4rails_address
    "#{logradouro}, #{numero}, #{bairro}, #{cidade}, #{uf}"
  end
  
  def gmaps4rails_infowindow
    "<h4>#{logradouro}, #{numero}, #{bairro}, #{cidade}, #{uf}</h4>"
  end
end
