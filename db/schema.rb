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

ActiveRecord::Schema.define(version: 20160718081518) do

  create_table "anime_genres", force: :cascade do |t|
    t.integer  "anime_id",   null: false
    t.integer  "genre_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["anime_id"], name: "index_anime_genres_on_anime_id"
    t.index ["genre_id"], name: "index_anime_genres_on_genre_id"
  end

  create_table "animes", force: :cascade do |t|
    t.string   "en_name",    null: false
    t.string   "jap_name"
    t.string   "ara_name"
    t.integer  "genre_id",   null: false
    t.date     "started",    null: false
    t.date     "finished"
    t.integer  "sesones"
    t.integer  "episods"
    t.integer  "rating_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_animes_on_genre_id"
    t.index ["rating_id"], name: "index_animes_on_rating_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string   "genre",       null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rates", force: :cascade do |t|
    t.string   "rate",              null: false
    t.string   "short_description"
    t.text     "description"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

end
