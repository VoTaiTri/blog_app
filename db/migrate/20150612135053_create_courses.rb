class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.integer :courseID
      t.integer :enroll
      t.integer :max_enroll
      t.string :term
      t.string :state
      t.text :note
      t.string :timetable
      t.string :division_state, default: "spending"
      t.references :subject, index: true

      t.timestamps null: false
    end
    add_foreign_key :courses, :subjects
  end
end
