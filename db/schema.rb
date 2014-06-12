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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140610184700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "especes", force: true do |t|
    t.integer  "taxref"
    t.integer  "bdtfx"
    t.string   "famille"
    t.string   "nom_sci"
    t.string   "auteur"
    t.integer  "annee"
    t.string   "nom_sci_complet"
    t.string   "nom_vern"
    t.string   "avatar"
    t.text     "reconnaissance"
    t.text     "confusion"
    t.text     "habitat_desc"
    t.text     "faune"
    t.string   "flo_s"
    t.integer  "flo_i"
    t.integer  "indic_pel"
    t.integer  "indic_pra"
    t.integer  "indic_fri"
    t.integer  "tol_fau"
    t.integer  "tol_pat"
    t.integer  "tol_pie"
    t.integer  "off_nec"
    t.integer  "off_pol"
    t.string   "pollen"
    t.integer  "hauteur"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gestions", force: true do |t|
    t.date     "gestion_date"
    t.string   "gen_prop"
    t.string   "gen_gest"
    t.string   "gen_struct"
    t.integer  "gen_surface"
    t.string   "gen_freq",              default: "[]"
    t.string   "hist_date"
    t.text     "hist_trav_info"
    t.text     "hist_desc"
    t.string   "hist_desc_date"
    t.string   "it_trav"
    t.string   "it_amend"
    t.string   "it_gestion"
    t.integer  "it_pat_nb"
    t.string   "it_pat_duree"
    t.string   "it_f_cal_prev"
    t.string   "it_f_cal_current"
    t.string   "it_p_cal_prev"
    t.string   "it_p_cal_current"
    t.boolean  "it_f_export"
    t.boolean  "it_phyto"
    t.string   "it_pression"
    t.boolean  "scp_info"
    t.text     "scp_desc"
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gen_obj"
    t.string   "hist_occsol"
    t.string   "hist_trav"
    t.string   "it_trav_freq"
    t.string   "it_trav_freq_reginfo"
    t.string   "it_amend_freq"
    t.string   "it_amend_freq_reginfo"
    t.string   "it_phyto_info"
  end

  add_index "gestions", ["site_id"], name: "index_gestions_on_site_id", using: :btree

  create_table "observations", force: true do |t|
    t.boolean  "q0"
    t.boolean  "q1"
    t.boolean  "q2"
    t.boolean  "q3"
    t.boolean  "q4"
    t.boolean  "q5"
    t.boolean  "q6"
    t.boolean  "q7"
    t.boolean  "q8"
    t.boolean  "q9"
    t.boolean  "q10"
    t.boolean  "p"
    t.integer  "espece_id"
    t.integer  "releve_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "observations", ["espece_id"], name: "index_observations_on_espece_id", using: :btree
  add_index "observations", ["releve_id"], name: "index_observations_on_releve_id", using: :btree

  create_table "ownerships", force: true do |t|
    t.integer  "user_id"
    t.integer  "site_id"
    t.boolean  "owner"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "releves", force: true do |t|
    t.date     "date"
    t.text     "name"
    t.string   "structure"
    t.string   "fonction"
    t.time     "time_start"
    t.time     "time_end"
    t.string   "hauteur"
    t.string   "milieux"
    t.integer  "user_id"
    t.integer  "site_id"
    t.integer  "gestion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "releves", ["gestion_id"], name: "index_releves_on_gestion_id", using: :btree
  add_index "releves", ["site_id"], name: "index_releves_on_site_id", using: :btree
  add_index "releves", ["user_id"], name: "index_releves_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sites", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "parc"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
    t.string   "topographie"
    t.string   "ensoleillement"
    t.string   "photo"
    t.boolean  "public"
    t.string   "plan"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "structure"
    t.string   "fonction"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
