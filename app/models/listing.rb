class Listing < ActiveRecord::Base
	if Rails.env.development?
		has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "defaultimage.png"
	else
		has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "defaultimage.png",
					  :storage => :dropbox,
					  :dropbox_credentials => Rails.root.join("config/dropbox.yml"),
					  :path => ":style/:id_:filename"
  	end
  	#do_not_validate_attachment_file_type :image
  	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
end
