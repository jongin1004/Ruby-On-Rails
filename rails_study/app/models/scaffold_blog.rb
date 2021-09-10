class ScaffoldBlog < ApplicationRecord
    # dependenet CASCADE와 같다. 
    has_many :comments, dependent: :destroy
end
