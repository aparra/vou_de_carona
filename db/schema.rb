# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121216134920) do

  create_table "amigos", :force => true do |t|
    t.integer  "caroneiro_id"
    t.integer  "amigo_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "assinante_newsletters", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "caroneiros", :force => true do |t|
    t.string   "nome",            :limit => 80
    t.string   "twitter"
    t.string   "facebook"
    t.string   "email"
    t.string   "hashed_password"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "enderecos", :force => true do |t|
    t.string   "logradouro"
    t.string   "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "uf"
    t.integer  "rota_id"
    t.integer  "origem_id"
    t.integer  "destino_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "rota", :force => true do |t|
    t.integer  "caroneiro_id"
    t.integer  "origem_id"
    t.integer  "destino_id"
    t.datetime "publicada_em"
    t.string   "nome"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
