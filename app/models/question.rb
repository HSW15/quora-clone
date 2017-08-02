class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers, dependent: :destroy
	validates :question_title, :presence => true, :length => { :minimum => 3 }
	validates :question_description, :presence => true, :length => { :minimum => 3 }
end
