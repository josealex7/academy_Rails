class CreateCursos < ActiveRecord::Migration[7.0]
  def change
    create_table :cursos do |t|
      t.string :name
      t.integer :grado

      t.timestamps
    end
  end
end
