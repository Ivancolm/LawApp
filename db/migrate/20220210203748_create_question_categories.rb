class CreateQuestionCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :question_categories do |t|
      t.belongs_to :question, null: false, foreign_key: true
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
