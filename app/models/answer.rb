class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question
	has_many :answers_votes
	has_many :questions_votes
end
