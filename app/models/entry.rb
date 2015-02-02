class Entry < ActiveRecord::Base
  	belongs_to :user

    has_many :comments, :dependent => :destroy

   	default_scope -> { order(created_at: :desc) }
  	
  	#mount_uploader :picture, PictureUploader

    validates :title, 	presence: true, length: {maximum: 50}
    validates :content, presence: true, length: { maximum: 140 }

    def comm
        Comment.where("entry_id = :entry_id", entry_id: id)
    end

    # Returns true if the current user is following the other user.
    #def following?(other_user)
        #following.include?(other_user)
    #end

end