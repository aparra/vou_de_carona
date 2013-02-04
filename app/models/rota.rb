class Rota < ActiveRecord::Base
  attr_accessible :caroneiro, :origem, :destino, :publicada_em, :nome, :ativa, :origem_attributes, :destino_attributes

  belongs_to :caroneiro

  has_one :origem, :foreign_key => "origem_id", :class_name => "Endereco", :dependent => :destroy
  has_one :destino, :foreign_key => "destino_id", :class_name => "Endereco", :dependent => :destroy

  accepts_nested_attributes_for :origem, :destino
  
  def owned_by?(owner)
    return false unless owner.is_a? Caroneiro
    caroneiro == owner
  end
  
  def mapa
    [origem, destino].to_gmaps4rails
  end  
end
