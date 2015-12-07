# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations.

ActiveRecord::Schema.define(version: 20_151_206_223_330) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'posts', force: :cascade do |t|
    t.text 'content'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.integer 'resource_id'
    t.string 'resource_type'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'roles', %w(name resource_type resource_id),
            name: 'index_roles_on_name_and_resource_type_and_resource_id',
            using: :btree
  add_index 'roles', ['name'], name: 'index_roles_on_name', using: :btree

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet 'current_sign_in_ip'
    t.inet 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'avatar_file_name'
    t.string 'avatar_content_type'
    t.integer 'avatar_file_size'
    t.datetime 'avatar_updated_at'
  end

  add_index 'users', ['email'], name: 'index_users_on_email',
                                unique: true, using: :btree
  add_index 'users', ['reset_password_token'],
            name: 'index_users_on_reset_password_token', unique: true,
            using: :btree

  create_table 'users_roles', id: false, force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'role_id'
  end

  add_index 'users_roles', %w(user_id role_id),
            name: 'index_users_roles_on_user_id_and_role_id',
            using: :btree
end
