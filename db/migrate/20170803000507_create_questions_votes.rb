class CreateQuestionsVotes < ActiveRecord::Migration[5.0]
	def change
		create_table :questions_votes do |t|
			t.integer :user_id
			t.integer :question_id
			t.boolean :vote, index: true
			t.timestamps
		end
	end
end
