class Author < ActiveRecord::Base
  validates :name, :surname, presence: true
  #validates :age, numericality: { only_integer: true, greater_than: 18 }

  def fullname
    "#{name} #{surname}"
  end

  has_many :comment
  #has_many :author_post
  #has_many :posts, through: :author_post
  has_many :posts

  scope :old, -> { where('age > 30') }
  scope :young, -> { where('age < 20') }

  before_create :default_age

  private

  def default_age
    self.age = 25 unless age
  end

end
