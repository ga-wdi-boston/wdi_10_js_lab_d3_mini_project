
ActiveRecord::Schema.define(version: 20140314140236) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crimecompacts", force: true do |t|
    t.integer  "survey_year"
    t.integer  "murder_total"
    t.integer  "sex_offense_total"
    t.integer  "robbery_total"
    t.integer  "aggravated_assault_total"
    t.integer  "burglary_total"
    t.integer  "motor_theft_total"
    t.integer  "arson_total"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "crimes", force: true do |t|
    t.integer  "survey_year"
    t.integer  "institution_size"
    t.integer  "murder"
    t.integer  "sex_offense"
    t.integer  "robbery"
    t.integer  "aggravated_assault"
    t.integer  "burglary"
    t.integer  "motor_theft"
    t.integer  "arson"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
