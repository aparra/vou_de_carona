class Endereco < ActiveRecord::Base
  attr_accessible :logradouro, :numero, :complemento, :bairro, :cidade, :uf
end
