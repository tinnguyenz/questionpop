class Question < ApplicationRecord
  belongs_to :shop
  has_many :answers
  has_many :question_contents

  attr_accessor :short_question_content

  validates :product_id, presence: true
  validates :customer_name, presence: true
  validates :customer_email, presence: true
  validates :customer_phone, presence: false
  validates :question_content, presence: true

  def short_question_content
    @short_question_content = self.question_content[0..25].gsub(/\s\w+$/,'...')
  end

  def self.existing_question(customer_email, product_id)
    Question.where(customer_email: customer_email, product_id: product_id).first
  end
end
