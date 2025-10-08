# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_10_07_185200) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "autores", force: :cascade do |t|
    t.string "nome"
    t.text "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "avaliacaos", force: :cascade do |t|
    t.bigint "usuario_id"
    t.bigint "musica_id"
    t.text "comentario"
    t.float "nota"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["musica_id"], name: "index_avaliacaos_on_musica_id"
    t.index ["usuario_id"], name: "index_avaliacaos_on_usuario_id"
  end

  create_table "curtidas", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.bigint "avaliacao_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avaliacao_id"], name: "index_curtidas_on_avaliacao_id"
    t.index ["usuario_id"], name: "index_curtidas_on_usuario_id"
  end

  create_table "musicas", force: :cascade do |t|
    t.string "nome"
    t.bigint "autor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autor_id"], name: "index_musicas_on_autor_id"
  end

  create_table "seguidas", force: :cascade do |t|
    t.bigint "usuario_id"
    t.bigint "autor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["autor_id"], name: "index_seguidas_on_autor_id"
    t.index ["usuario_id"], name: "index_seguidas_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.text "email"
    t.text "username"
    t.text "senha"
    t.date "data_nasc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "avaliacaos", "musicas"
  add_foreign_key "avaliacaos", "usuarios"
  add_foreign_key "curtidas", "avaliacaos"
  add_foreign_key "curtidas", "usuarios"
  add_foreign_key "musicas", "autores", column: "autor_id"
  add_foreign_key "seguidas", "autores", column: "autor_id"
  add_foreign_key "seguidas", "usuarios"
end
