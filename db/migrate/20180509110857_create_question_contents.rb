class CreateQuestionContents < ActiveRecord::Migration[5.0]
  def change
    create_table :question_contents do |t|
      t.belongs_to :question
      t.string :content

      t.timestamps
    end
  end
end
