class CreateAnswers < ActiveRecord::Migration[5.0]
	def change
		create_table :answers do |t|

			t.string :answer_description
			t.integer :upvote_count, :default => 0
			t.integer :downvote_count, :default => 0
			t.integer :question_id, index: true
			t.integer :user_id
			t.timestamps
		end
	end
end
