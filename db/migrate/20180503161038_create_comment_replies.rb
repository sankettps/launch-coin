class CreateCommentReplies < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_replies do |t|
      t.references :launcher, foreign_key: true
      t.references :comment, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
