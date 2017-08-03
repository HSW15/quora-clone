class CreateAnswersVotes < ActiveRecord::Migration[5.0]
	def change
		create_table :answers_votes do |t|
			t.integer :user_id
			t.integer :answer_id
			t.boolean :vote, index: true
			t.timestamps
		end
	end
end
