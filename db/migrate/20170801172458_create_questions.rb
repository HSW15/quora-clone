class CreateQuestions < ActiveRecord::Migration[5.0]
	def change
		create_table :questions do |t|

			t.string :question_title
			t.string :question_description
			t.integer :upvote_count, :default => 0
			t.integer :downvote_count, :default => 0
			t.integer :user_id, index:true
			t.timestamps
			
		end
	end
end
