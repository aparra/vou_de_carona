#encoding: utf-8

require 'digest'

class Caroneiro < ActiveRecord::Base
  include Gravtastic
  gravtastic :size => 100
  
  attr_accessible :nome, :email, :twitter, :facebook, :password, :password_confirmation
  attr_accessor :password
  
  validates_presence_of :nome, :message => "deve ser preenchido"
  validates_presence_of :password, :message => "deve ser preenchido"
  
  validates :email, :uniqueness => true,
    :format => {:with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i, :message => "formato inválido"}

  validates_confirmation_of :password

  has_many :rotas, :order => "publicada_em DESC", :dependent => :destroy

  has_many :amigos
  has_many :caroneiros, :source => :amigo, :through => :amigos
  
  before_save :encrypt_new_password

  def self.autentica(email, password)
    caroneiro = find_by_email(email)
    return caroneiro if caroneiro && caroneiro.autenticado?(password)
  end

  def autenticado?(password)
    self.hashed_password == encrypt(password)
  end

  def conectado?(amigo)
    return false unless amigo.is_a? Caroneiro
    caroneiros.include? amigo
  end

  def conhece?(caroneiro)
    return "1o" if self.conectado?(caroneiro)
    grau_conhecimento = "desconhecido"
    caroneiros.each {|amigo|
      if amigo.conectado?(caroneiro)
        grau_conhecimento = "2o"
        break
      end
    }
    grau_conhecimento
  end

  protected
  def encrypt_new_password
    return if password.blank?
    self.hashed_password = encrypt(password)
  end

  def password_required?
    hashed_password.blank? || password.present?
  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end
end
