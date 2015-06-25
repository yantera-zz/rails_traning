class Book < ActiveRecord::Base
  validates :isbn,
    presence: { message: 'は必須です' },
    uniqueness: { allow_blank: :true, message: '%{value}は一意でなければなりません' },
    length: { is: 17 , allow_blank: true, message: '%{value}は%{cont}桁でなければなりません' },
    isbn: { allow_old: true },
    format: { with: /\A[0-9]{3}-[0-9]{1}-[0-9]{3,5}-[0-9]{4}-[0-9X]{1}\z/, allow_blank: true, message: '%{value}は正しい形式ではありません'}
  validates :title,
    presence: true,
    length: { minimum: 1, maximum: 100 }
  validates :price,
    numericality: { only_integer: true, less_than: 10000 }
  validates :publish,
    inclusion: { in: ['技術評論社','翔泳社','秀和システム','日経BP社','技術評論社']}
  validates :title,
    uniqueness: { scope: :publish }
  scope :gihyo, -> { where(publish: '技術評論社') }
  scope :newer, -> { order(published: :desc) }
  scope :top10, -> { newer.limit(10) }
  scope :whats_new, ->(pub) {
    where(publish: pub).order(published: :desc).limit(5)
  }
end
