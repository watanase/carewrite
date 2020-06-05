class User < ApplicationRecord
  has_secure_password
  has_many :families, dependent: :destroy
  has_many :posts
  belongs_to :company
  belongs_to :group

  validates :name, presence: true

  enum gender:  { '性別を選択': 0, '男性': 1, '女性': 2 }
  enum care_required: { '介護度を選択': 0, '要支援１': 1, '要支援２': 2, '要介護１': 3, '要介護２': 4, '要介護３': 5, '要介護４': 6, '要介護５': 7}
  enum status: { '入居予定': 0, '入居中': 1, '退去済み': 2 }
end
