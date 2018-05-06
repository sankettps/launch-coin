class CreateCommentReplyLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :comment_reply_likes do |t|
      t.references :launcher, foreign_key: true
      t.references :comment_reply, foreign_key: true
      t.boolean :is_liked

      t.timestamps
    end
  end
end
