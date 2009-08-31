class Person < ActiveRecord::Base
  has_attached_file :picture, 
                    :styles => {:main => "250x250#", :thumb => "100x100#"},
                    :storage => :s3,
                    :s3_credentials => {
                      :access_key_id => S3_CONFIG['aws_access_key'], 
                      :secret_access_key => S3_CONFIG['aws_secret_access_key']
                      },
                    :s3_permissions => "public-read",
                    :bucket => "rat-1111",
                    :path => "people/:id/:styles/:basename.:extension",
                    :url => "people/:id/:styles/:basename.:extension"
                    
  validates_attachment_content_type :picture, :content_type => ["image/jpeg", "image/jpg", "image/png", "image/gif", "image/png", "image/pjpeg", "image/x-png"], :message => "Only upload .jpeg, ;gif or .png images"
  
end
