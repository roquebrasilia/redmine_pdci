class TbPoll < ActiveRecord::Base
  unloadable

  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :project
  attr_accessible :no, :question, :yes

  validates :project, :author, presence: true
  
  def vote(answer)
    increment(answer == "yes" ? :yes : :no)
  end
  
end
