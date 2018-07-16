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

  before_destroy :destroy_comments
  before_destroy :destroy_posts

  private

  def default_age
    self.age = 25 unless age
  end

  def destroy_comments
    Comment.where(author_id: self.id).destroy_all
  end

  def destroy_posts
    Post.where(author_id: self.id).destroy_all
  end

end
