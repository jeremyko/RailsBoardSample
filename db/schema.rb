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

ActiveRecord::Schema.define(:version => 20120822082348) do

  create_table "apex$_acl", :force => true do |t|
    t.decimal  "ws_app_id",               :null => false
    t.string   "username",                :null => false
    t.string   "priv",       :limit => 1, :null => false
    t.datetime "created_on",              :null => false
    t.string   "created_by",              :null => false
    t.datetime "updated_on"
    t.string   "updated_by"
  end

  add_index "apex$_acl", ["ws_app_id"], :name => "apex$_acl_idx1"

  create_table "apex$_ws_files", :force => true do |t|
    t.decimal  "ws_app_id",                           :null => false
    t.decimal  "data_grid_id"
    t.decimal  "row_id"
    t.decimal  "webpage_id"
    t.string   "component_level",     :limit => 30
    t.string   "name",                                :null => false
    t.string   "image_alias"
    t.string   "image_attributes"
    t.binary   "content"
    t.datetime "content_last_update"
    t.string   "mime_type",                           :null => false
    t.string   "content_charset"
    t.string   "content_filename",    :limit => 500
    t.string   "description",         :limit => 4000
    t.datetime "created_on",                          :null => false
    t.string   "created_by",                          :null => false
    t.datetime "updated_on"
    t.string   "updated_by"
  end

  add_index "apex$_ws_files", ["ws_app_id", "data_grid_id", "row_id"], :name => "apex$_ws_files_idx1"
  add_index "apex$_ws_files", ["ws_app_id", "webpage_id"], :name => "apex$_ws_files_idx2"

  create_table "apex$_ws_history", :id => false, :force => true do |t|
    t.decimal  "row_id",                              :null => false
    t.decimal  "ws_app_id",                           :null => false
    t.decimal  "data_grid_id",                        :null => false
    t.string   "column_name"
    t.string   "old_value",           :limit => 4000
    t.string   "new_value",           :limit => 4000
    t.string   "application_user_id"
    t.datetime "change_date"
  end

  add_index "apex$_ws_history", ["ws_app_id", "data_grid_id", "row_id"], :name => "apex$_ws_history_idx"

  create_table "apex$_ws_links", :force => true do |t|
    t.decimal  "ws_app_id",                        :null => false
    t.decimal  "data_grid_id"
    t.decimal  "row_id"
    t.decimal  "webpage_id"
    t.string   "component_level",  :limit => 30
    t.string   "tags",             :limit => 4000
    t.string   "show_on_homepage", :limit => 1
    t.string   "link_name",                        :null => false
    t.string   "url",              :limit => 4000, :null => false
    t.string   "link_description", :limit => 4000
    t.decimal  "display_sequence"
    t.datetime "created_on",                       :null => false
    t.string   "created_by",                       :null => false
    t.datetime "updated_on"
    t.string   "updated_by"
  end

  add_index "apex$_ws_links", ["ws_app_id", "data_grid_id", "row_id"], :name => "apex$_ws_links_idx1"
  add_index "apex$_ws_links", ["ws_app_id", "webpage_id"], :name => "apex$_ws_links_idx2"

  create_table "apex$_ws_notes", :force => true do |t|
    t.decimal  "ws_app_id",                     :null => false
    t.decimal  "data_grid_id"
    t.decimal  "row_id"
    t.decimal  "webpage_id"
    t.string   "component_level", :limit => 30
    t.text     "content"
    t.datetime "created_on",                    :null => false
    t.string   "created_by",                    :null => false
    t.datetime "updated_on"
    t.string   "updated_by"
  end

  add_index "apex$_ws_notes", ["ws_app_id", "data_grid_id", "row_id"], :name => "apex$_ws_notes_idx1"
  add_index "apex$_ws_notes", ["ws_app_id", "webpage_id"], :name => "apex$_ws_notes_idx2"

  create_table "apex$_ws_rows", :force => true do |t|
    t.decimal  "ws_app_id",                     :null => false
    t.decimal  "data_grid_id",                  :null => false
    t.string   "unique_value"
    t.string   "tags",          :limit => 4000
    t.decimal  "parent_row_id"
    t.string   "owner"
    t.string   "geocode",       :limit => 512
    t.decimal  "load_order"
    t.decimal  "change_count"
    t.datetime "created_on",                    :null => false
    t.string   "created_by",                    :null => false
    t.datetime "updated_on"
    t.string   "updated_by"
    t.string   "c001",          :limit => 4000
    t.string   "c002",          :limit => 4000
    t.string   "c003",          :limit => 4000
    t.string   "c004",          :limit => 4000
    t.string   "c005",          :limit => 4000
    t.string   "c006",          :limit => 4000
    t.string   "c007",          :limit => 4000
    t.string   "c008",          :limit => 4000
    t.string   "c009",          :limit => 4000
    t.string   "c010",          :limit => 4000
    t.string   "c011",          :limit => 4000
    t.string   "c012",          :limit => 4000
    t.string   "c013",          :limit => 4000
    t.string   "c014",          :limit => 4000
    t.string   "c015",          :limit => 4000
    t.string   "c016",          :limit => 4000
    t.string   "c017",          :limit => 4000
    t.string   "c018",          :limit => 4000
    t.string   "c019",          :limit => 4000
    t.string   "c020",          :limit => 4000
    t.string   "c021",          :limit => 4000
    t.string   "c022",          :limit => 4000
    t.string   "c023",          :limit => 4000
    t.string   "c024",          :limit => 4000
    t.string   "c025",          :limit => 4000
    t.string   "c026",          :limit => 4000
    t.string   "c027",          :limit => 4000
    t.string   "c028",          :limit => 4000
    t.string   "c029",          :limit => 4000
    t.string   "c030",          :limit => 4000
    t.string   "c031",          :limit => 4000
    t.string   "c032",          :limit => 4000
    t.string   "c033",          :limit => 4000
    t.string   "c034",          :limit => 4000
    t.string   "c035",          :limit => 4000
    t.string   "c036",          :limit => 4000
    t.string   "c037",          :limit => 4000
    t.string   "c038",          :limit => 4000
    t.string   "c039",          :limit => 4000
    t.string   "c040",          :limit => 4000
    t.string   "c041",          :limit => 4000
    t.string   "c042",          :limit => 4000
    t.string   "c043",          :limit => 4000
    t.string   "c044",          :limit => 4000
    t.string   "c045",          :limit => 4000
    t.string   "c046",          :limit => 4000
    t.string   "c047",          :limit => 4000
    t.string   "c048",          :limit => 4000
    t.string   "c049",          :limit => 4000
    t.string   "c050",          :limit => 4000
    t.decimal  "n001"
    t.decimal  "n002"
    t.decimal  "n003"
    t.decimal  "n004"
    t.decimal  "n005"
    t.decimal  "n006"
    t.decimal  "n007"
    t.decimal  "n008"
    t.decimal  "n009"
    t.decimal  "n010"
    t.decimal  "n011"
    t.decimal  "n012"
    t.decimal  "n013"
    t.decimal  "n014"
    t.decimal  "n015"
    t.decimal  "n016"
    t.decimal  "n017"
    t.decimal  "n018"
    t.decimal  "n019"
    t.decimal  "n020"
    t.decimal  "n021"
    t.decimal  "n022"
    t.decimal  "n023"
    t.decimal  "n024"
    t.decimal  "n025"
    t.decimal  "n026"
    t.decimal  "n027"
    t.decimal  "n028"
    t.decimal  "n029"
    t.decimal  "n030"
    t.decimal  "n031"
    t.decimal  "n032"
    t.decimal  "n033"
    t.decimal  "n034"
    t.decimal  "n035"
    t.decimal  "n036"
    t.decimal  "n037"
    t.decimal  "n038"
    t.decimal  "n039"
    t.decimal  "n040"
    t.decimal  "n041"
    t.decimal  "n042"
    t.decimal  "n043"
    t.decimal  "n044"
    t.decimal  "n045"
    t.decimal  "n046"
    t.decimal  "n047"
    t.decimal  "n048"
    t.decimal  "n049"
    t.decimal  "n050"
    t.datetime "d001"
    t.datetime "d002"
    t.datetime "d003"
    t.datetime "d004"
    t.datetime "d005"
    t.datetime "d006"
    t.datetime "d007"
    t.datetime "d008"
    t.datetime "d009"
    t.datetime "d010"
    t.datetime "d011"
    t.datetime "d012"
    t.datetime "d013"
    t.datetime "d014"
    t.datetime "d015"
    t.datetime "d016"
    t.datetime "d017"
    t.datetime "d018"
    t.datetime "d019"
    t.datetime "d020"
    t.datetime "d021"
    t.datetime "d022"
    t.datetime "d023"
    t.datetime "d024"
    t.datetime "d025"
    t.datetime "d026"
    t.datetime "d027"
    t.datetime "d028"
    t.datetime "d029"
    t.datetime "d030"
    t.datetime "d031"
    t.datetime "d032"
    t.datetime "d033"
    t.datetime "d034"
    t.datetime "d035"
    t.datetime "d036"
    t.datetime "d037"
    t.datetime "d038"
    t.datetime "d039"
    t.datetime "d040"
    t.datetime "d041"
    t.datetime "d042"
    t.datetime "d043"
    t.datetime "d044"
    t.datetime "d045"
    t.datetime "d046"
    t.datetime "d047"
    t.datetime "d048"
    t.datetime "d049"
    t.datetime "d050"
    t.text     "clob001"
    t.text     "search_clob"
  end

  add_index "apex$_ws_rows", ["ws_app_id", "data_grid_id"], :name => "apex$_ws_rows_idx"

  create_table "apex$_ws_tags", :force => true do |t|
    t.decimal  "ws_app_id",                       :null => false
    t.decimal  "data_grid_id"
    t.decimal  "row_id"
    t.decimal  "webpage_id"
    t.string   "component_level", :limit => 30
    t.string   "tag",             :limit => 4000
    t.datetime "created_on",                      :null => false
    t.string   "created_by",                      :null => false
    t.datetime "updated_on"
    t.string   "updated_by"
  end

  add_index "apex$_ws_tags", ["ws_app_id", "data_grid_id", "row_id"], :name => "apex$_ws_tags_idx1"
  add_index "apex$_ws_tags", ["ws_app_id", "webpage_id"], :name => "apex$_ws_tags_idx2"

  create_table "apex$_ws_webpg_section_history", :id => false, :force => true do |t|
    t.decimal  "section_id",                           :null => false
    t.decimal  "ws_app_id",                            :null => false
    t.decimal  "webpage_id",                           :null => false
    t.decimal  "old_display_sequence"
    t.decimal  "new_display_sequence"
    t.string   "old_title",            :limit => 4000
    t.string   "new_title",            :limit => 4000
    t.text     "old_content"
    t.text     "new_content"
    t.string   "application_user_id",                  :null => false
    t.datetime "change_date",                          :null => false
  end

  add_index "apex$_ws_webpg_section_history", ["ws_app_id", "webpage_id", "section_id"], :name => "apex$_ws_webpg_sechist_idx1"

  create_table "apex$_ws_webpg_sections", :force => true do |t|
    t.decimal  "ws_app_id",                            :null => false
    t.decimal  "webpage_id"
    t.decimal  "display_sequence"
    t.string   "section_type",         :limit => 30,   :null => false
    t.string   "title",                :limit => 4000
    t.text     "content"
    t.text     "content_upper"
    t.decimal  "nav_start_webpage_id"
    t.decimal  "nav_max_level"
    t.string   "nav_include_link",     :limit => 1
    t.decimal  "data_grid_id"
    t.decimal  "report_id"
    t.decimal  "data_section_style"
    t.string   "chart_type"
    t.string   "chart_3d",             :limit => 1
    t.string   "chart_label"
    t.string   "label_axis_title"
    t.string   "chart_value"
    t.string   "value_axis_title"
    t.string   "chart_aggregate"
    t.string   "chart_sorting"
    t.datetime "created_on",                           :null => false
    t.string   "created_by",                           :null => false
    t.datetime "updated_on"
    t.string   "updated_by"
  end

  create_table "auth_group", :force => true do |t|
    t.string "name", :limit => nil
  end

  add_index "auth_group", ["name"], :name => "sys_c007283", :unique => true

  create_table "auth_group_permissions", :force => true do |t|
    t.integer "group_id",      :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer "permission_id", :limit => 11, :precision => 11, :scale => 0, :null => false
  end

  add_index "auth_group_permissions", ["group_id", "permission_id"], :name => "sys_c007279", :unique => true
  add_index "auth_group_permissions", ["group_id"], :name => "auth_group_permissions_4253682"
  add_index "auth_group_permissions", ["permission_id"], :name => "auth_group_permissions_1e076e3"

  create_table "auth_permission", :force => true do |t|
    t.string  "name",            :limit => nil
    t.integer "content_type_id", :limit => 11,  :precision => 11, :scale => 0, :null => false
    t.string  "codename",        :limit => nil
  end

  add_index "auth_permission", ["content_type_id", "codename"], :name => "sys_c007274", :unique => true
  add_index "auth_permission", ["content_type_id"], :name => "auth_permission_1bb8f392"

  create_table "auth_user", :force => true do |t|
    t.string    "username",     :limit => nil
    t.string    "first_name",   :limit => nil
    t.string    "last_name",    :limit => nil
    t.string    "email",        :limit => nil
    t.string    "password",     :limit => nil
    t.boolean   "is_staff",                    :precision => 1, :scale => 0, :null => false
    t.boolean   "is_active",                   :precision => 1, :scale => 0, :null => false
    t.boolean   "is_superuser",                :precision => 1, :scale => 0, :null => false
    t.timestamp "last_login",   :limit => 6,                                 :null => false
    t.timestamp "date_joined",  :limit => 6,                                 :null => false
  end

  add_index "auth_user", ["username"], :name => "sys_c007307", :unique => true

  create_table "auth_user_groups", :force => true do |t|
    t.integer "user_id",  :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer "group_id", :limit => 11, :precision => 11, :scale => 0, :null => false
  end

  add_index "auth_user_groups", ["group_id"], :name => "auth_user_groups_425ae3c4"
  add_index "auth_user_groups", ["user_id", "group_id"], :name => "sys_c007295", :unique => true
  add_index "auth_user_groups", ["user_id"], :name => "auth_user_groups_403f60f"

  create_table "auth_user_user_permissions", :force => true do |t|
    t.integer "user_id",       :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer "permission_id", :limit => 11, :precision => 11, :scale => 0, :null => false
  end

  add_index "auth_user_user_permissions", ["permission_id"], :name => "auth_user_user_permissions6daa"
  add_index "auth_user_user_permissions", ["user_id", "permission_id"], :name => "sys_c007289", :unique => true
  add_index "auth_user_user_permissions", ["user_id"], :name => "auth_user_user_permissions6fa9"

  create_table "board", :primary_key => "aid", :force => true do |t|
    t.integer  "rid",        :limit => 10,  :precision => 10, :scale => 0
    t.string   "dbsubject",  :limit => 50
    t.string   "dbname",     :limit => 50
    t.datetime "dbdate"
    t.string   "dbemail",    :limit => 50
    t.string   "dbhomepage", :limit => 50
    t.integer  "dbhits",     :limit => 10,  :precision => 10, :scale => 0
    t.string   "dbmemo",     :limit => 500
  end

  create_table "books_author", :force => true do |t|
    t.string "first_name", :limit => nil
    t.string "last_name",  :limit => nil
    t.string "email",      :limit => nil
  end

  create_table "books_book", :force => true do |t|
    t.string   "title",            :limit => nil
    t.integer  "publisher_id",     :limit => 11,  :precision => 11, :scale => 0, :null => false
    t.datetime "publication_date",                                               :null => false
  end

  add_index "books_book", ["publisher_id"], :name => "books_book_22dd9c39"

  create_table "books_book_authors", :force => true do |t|
    t.integer "book_id",   :limit => 11, :precision => 11, :scale => 0, :null => false
    t.integer "author_id", :limit => 11, :precision => 11, :scale => 0, :null => false
  end

  add_index "books_book_authors", ["author_id"], :name => "books_book_authors_337b96ff"
  add_index "books_book_authors", ["book_id", "author_id"], :name => "sys_c007343", :unique => true
  add_index "books_book_authors", ["book_id"], :name => "books_book_authors_752eb95b"

  create_table "books_publisher", :force => true do |t|
    t.string "name",           :limit => nil
    t.string "address",        :limit => nil
    t.string "city",           :limit => nil
    t.string "state_province", :limit => nil
    t.string "country",        :limit => nil
    t.string "website",        :limit => nil
  end

  create_table "customer", :force => true do |t|
    t.decimal "seq",                :null => false
    t.string  "pwd",  :limit => 8
    t.string  "name", :limit => 20
  end

  create_table "customer_order", :id => false, :force => true do |t|
    t.string "id",      :limit => 8,  :null => false
    t.string "item_id", :limit => 10
  end

  create_table "demo_customers", :primary_key => "customer_id", :force => true do |t|
    t.string  "cust_first_name",      :limit => 20,                               :null => false
    t.string  "cust_last_name",       :limit => 20,                               :null => false
    t.string  "cust_street_address1", :limit => 60
    t.string  "cust_street_address2", :limit => 60
    t.string  "cust_city",            :limit => 30
    t.string  "cust_state",           :limit => 2
    t.string  "cust_postal_code",     :limit => 10
    t.string  "phone_number1",        :limit => 25
    t.string  "phone_number2",        :limit => 25
    t.decimal "credit_limit",                       :precision => 9, :scale => 2
    t.string  "cust_email",           :limit => 30
  end

  add_index "demo_customers", ["cust_last_name", "cust_first_name"], :name => "demo_cust_name_ix"

  create_table "demo_order_items", :primary_key => "order_item_id", :force => true do |t|
    t.decimal "order_id",                                              :null => false
    t.decimal "product_id",                                            :null => false
    t.decimal "unit_price",              :precision => 8, :scale => 2, :null => false
    t.integer "quantity",   :limit => 8, :precision => 8, :scale => 0, :null => false
  end

  create_table "demo_orders", :primary_key => "order_id", :force => true do |t|
    t.decimal  "customer_id",                                   :null => false
    t.decimal  "order_total",     :precision => 8, :scale => 2
    t.datetime "order_timestamp"
    t.decimal  "user_id"
  end

  add_index "demo_orders", ["customer_id"], :name => "demo_ord_customer_ix"

  create_table "demo_product_info", :primary_key => "product_id", :force => true do |t|
    t.string   "product_name",        :limit => 50
    t.string   "product_description", :limit => 2000
    t.string   "category",            :limit => 30
    t.string   "product_avail",       :limit => 1
    t.decimal  "list_price",                          :precision => 8, :scale => 2
    t.binary   "product_image"
    t.string   "mimetype"
    t.string   "filename",            :limit => 400
    t.datetime "image_last_update"
  end

  create_table "demo_states", :id => false, :force => true do |t|
    t.string "st",         :limit => 30
    t.string "state_name", :limit => 30
  end

  create_table "demo_users", :primary_key => "user_id", :force => true do |t|
    t.string   "user_name",  :limit => 100
    t.string   "password",   :limit => 4000
    t.datetime "created_on"
    t.decimal  "quota"
    t.string   "products",   :limit => 1
    t.datetime "expires_on"
    t.string   "admin_user", :limit => 1
  end

  create_table "dept", :primary_key => "deptno", :force => true do |t|
    t.string "dname", :limit => 14
    t.string "loc",   :limit => 13
  end

  create_table "django_admin_log", :force => true do |t|
    t.timestamp "action_time",     :limit => 6,                                  :null => false
    t.integer   "user_id",         :limit => 11,  :precision => 11, :scale => 0, :null => false
    t.integer   "content_type_id", :limit => 11,  :precision => 11, :scale => 0
    t.text      "object_id"
    t.string    "object_repr",     :limit => nil
    t.integer   "action_flag",     :limit => 11,  :precision => 11, :scale => 0, :null => false
    t.text      "change_message"
  end

  add_index "django_admin_log", ["content_type_id"], :name => "django_admin_log_1bb8f392"
  add_index "django_admin_log", ["user_id"], :name => "django_admin_log_403f60f"

  create_table "django_content_type", :force => true do |t|
    t.string "name",      :limit => nil
    t.string "app_label", :limit => nil
    t.string "model",     :limit => nil
  end

  add_index "django_content_type", ["app_label", "model"], :name => "sys_c007312", :unique => true

  create_table "django_session", :primary_key => "session_key", :force => true do |t|
    t.text      "session_data"
    t.timestamp "expire_date",  :limit => 6, :null => false
  end

  add_index "django_session", ["expire_date"], :name => "django_session_3da3d3d8"

  create_table "django_site", :force => true do |t|
    t.string "domain", :limit => nil
    t.string "name",   :limit => nil
  end

  create_table "emp", :primary_key => "empno", :force => true do |t|
    t.string   "ename",    :limit => 10
    t.string   "job",      :limit => 9
    t.integer  "mgr",      :limit => 4,  :precision => 4, :scale => 0
    t.datetime "hiredate"
    t.decimal  "sal",                    :precision => 7, :scale => 2
    t.decimal  "comm",                   :precision => 7, :scale => 2
    t.integer  "deptno",   :limit => 2,  :precision => 2, :scale => 0
  end

  create_table "jpa_family", :force => true do |t|
    t.string "description"
  end

  create_table "jpa_job", :force => true do |t|
    t.string  "jobdescr"
    t.decimal "salary",   :precision => 19, :scale => 4
  end

  create_table "jpa_person", :force => true do |t|
    t.string  "firstname"
    t.string  "lastname"
    t.integer "family_id", :limit => 10, :precision => 10, :scale => 0
  end

  create_table "jpa_person_jpa_job", :id => false, :force => true do |t|
    t.string  "jpa_person_id",                                              :null => false
    t.integer "joblist_id",    :limit => 10, :precision => 10, :scale => 0, :null => false
  end

  create_table "my_rails_boards", :force => true do |t|
    t.string   "subject"
    t.string   "name"
    t.string   "mail"
    t.string   "memo"
    t.integer  "hits",       :precision => 38, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "polls_choice", :force => true do |t|
    t.integer "poll_id", :limit => 11,  :precision => 11, :scale => 0, :null => false
    t.string  "choice",  :limit => nil
    t.integer "votes",   :limit => 11,  :precision => 11, :scale => 0, :null => false
  end

  add_index "polls_choice", ["poll_id"], :name => "polls_choice_763e883"

  create_table "polls_poll", :force => true do |t|
    t.string    "question", :limit => nil
    t.timestamp "pub_date", :limit => 6,   :null => false
  end

  create_table "posts", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sample_board_djangoboard", :force => true do |t|
    t.string   "subject",      :limit => nil
    t.string   "name",         :limit => nil
    t.datetime "created_date"
    t.string   "mail",         :limit => nil
    t.string   "memo",         :limit => nil
    t.integer  "hits",         :limit => 11,  :precision => 11, :scale => 0
  end

  create_table "sequence", :primary_key => "seq_name", :force => true do |t|
    t.integer "seq_count", :precision => 38, :scale => 0
  end

  create_table "spring_board", :force => true do |t|
    t.string   "subject",      :limit => 50
    t.string   "name",         :limit => 50
    t.datetime "created_date"
    t.string   "mail",         :limit => 50
    t.string   "memo",         :limit => 200
    t.integer  "hits",         :limit => 10,  :precision => 10, :scale => 0
  end

  create_table "talk", :id => false, :force => true do |t|
    t.decimal  "id",                       :null => false
    t.string   "text",      :limit => 100
    t.datetime "when"
    t.decimal  "talker_id",                :null => false
  end

  create_table "talker", :force => true do |t|
    t.string "username", :limit => 20
    t.string "password", :limit => 10
    t.string "fullname", :limit => 30
    t.string "email",    :limit => 30
  end

  add_foreign_key "apex$_ws_files", "apex$_ws_rows", :column => "row_id", :name => "apex$_ws_files_fk", :dependent => :delete

  add_foreign_key "apex$_ws_links", "apex$_ws_rows", :column => "row_id", :name => "apex$_ws_links_fk", :dependent => :delete

  add_foreign_key "apex$_ws_notes", "apex$_ws_rows", :column => "row_id", :name => "apex$_ws_notes_fk", :dependent => :delete

  add_foreign_key "apex$_ws_tags", "apex$_ws_rows", :column => "row_id", :name => "apex$_ws_tags_fk", :dependent => :delete

  add_foreign_key "auth_group_permissions", "auth_group", :column => "group_id", :name => "group_id_refs_id_3cea63fe"
  add_foreign_key "auth_group_permissions", "auth_permission", :column => "permission_id", :name => "sys_c007280"

  add_foreign_key "auth_permission", "django_content_type", :column => "content_type_id", :name => "content_type_id_refs_id_72724a"

  add_foreign_key "auth_user_groups", "auth_group", :column => "group_id", :name => "sys_c007296"
  add_foreign_key "auth_user_groups", "auth_user", :column => "user_id", :name => "user_id_refs_id_7ceef80f"

  add_foreign_key "auth_user_user_permissions", "auth_permission", :column => "permission_id", :name => "sys_c007290"
  add_foreign_key "auth_user_user_permissions", "auth_user", :column => "user_id", :name => "user_id_refs_id_dfbab7d"

  add_foreign_key "books_book", "books_publisher", :column => "publisher_id", :name => "sys_c007349"

  add_foreign_key "books_book_authors", "books_author", :column => "author_id", :name => "sys_c007344"
  add_foreign_key "books_book_authors", "books_book", :column => "book_id", :name => "book_id_refs_id_30430d9e"

  add_foreign_key "demo_order_items", "demo_orders", :column => "order_id", :primary_key => nil, :name => "demo_order_items_fk", :dependent => :delete
  add_foreign_key "demo_order_items", "demo_product_info", :column => "product_id", :primary_key => nil, :name => "demo_order_items_product_id_fk", :dependent => :delete

  add_foreign_key "demo_orders", "demo_customers", :column => "customer_id", :primary_key => nil, :name => "demo_orders_customer_id_fk"
  add_foreign_key "demo_orders", "demo_users", :column => "user_id", :primary_key => nil, :name => "demo_orders_user_id_fk"

  add_foreign_key "django_admin_log", "auth_user", :column => "user_id", :name => "sys_c007333"
  add_foreign_key "django_admin_log", "django_content_type", :column => "content_type_id", :name => "sys_c007334"

  add_foreign_key "emp", "dept", :column => "deptno", :primary_key => nil, :name => "sys_c006994"
  add_foreign_key "emp", "emp", :column => "mgr", :primary_key => nil, :name => "sys_c006993"

  add_foreign_key "jpa_person", "jpa_family", :column => "family_id", :name => "fk_jpa_person_family_id"

  add_foreign_key "jpa_person_jpa_job", "jpa_job", :column => "joblist_id", :name => "jpa_person_jpa_job_joblist_id"
  add_foreign_key "jpa_person_jpa_job", "jpa_person", :name => "jpaperson_jpa_jobjpa_person_id"

  add_foreign_key "polls_choice", "polls_poll", :column => "poll_id", :name => "sys_c007326"

end
