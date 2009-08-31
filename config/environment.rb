RAILS_GEM_VERSION = '2.3.3' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

S3_CONFIG = YAML.load_file("#{RAILS_ROOT}/config/s3.yml")[RAILS_ENV]

Rails::Initializer.run do |config|
  
  # This demonstrates paperclip 2.3.1's incompatibility with the
  # RightAWS gem. If they are loaded side-by-side, with 'right_aws' 
  # loaded after Paperclip, 
  
  config.gem "thoughtbot-paperclip", :lib => "paperclip", :version => "2.3.1"
  # config.gem "right_aws"
  

  # First try with RightAWS in the after_initialize block. Then
  # comment it out and uncomment the one above. Even though 'right_aws'
  # is required after paperclip, it fails with the familiar ArgumentError.
  # See below for error details.
  config.after_initialize do
    config.gem "right_aws"
  end

  config.time_zone = 'UTC'
end


### RightAWS argument error when Paperclip is loaded, relavent portion of the stack trace
#
# ArgumentError (wrong number of arguments (5 for 4)):
# 
# /Library/Ruby/Gems/1.8/gems/right_http_connection-1.2.4/lib/net_fix.rb:85:in `send_request_with_body_stream'
# /Library/Ruby/Gems/1.8/gems/right_http_connection-1.2.4/lib/net_fix.rb:85:in `exec'
# /Library/Ruby/Gems/1.8/gems/right_http_connection-1.2.4/lib/net_fix.rb:144:in `request'
# /Library/Ruby/Gems/1.8/gems/aws-s3-0.6.2/lib/aws/s3/connection.rb:45:in `request'
# /Library/Ruby/Gems/1.8/gems/aws-s3-0.6.2/lib/aws/s3/connection.rb:52:in `request'
# /Library/Ruby/Gems/1.8/gems/aws-s3-0.6.2/lib/aws/s3/base.rb:69:in `request'
# /Library/Ruby/Gems/1.8/gems/aws-s3-0.6.2/lib/aws/s3/base.rb:88:in `put'
# /Library/Ruby/Gems/1.8/gems/aws-s3-0.6.2/lib/aws/s3/object.rb:241:in `store'
# /Library/Ruby/Gems/1.8/gems/thoughtbot-paperclip-2.3.1/lib/paperclip/storage.rb:202:in `flush_writes'
# /Library/Ruby/Gems/1.8/gems/thoughtbot-paperclip-2.3.1/lib/paperclip/storage.rb:199:in `each'
# /Library/Ruby/Gems/1.8/gems/thoughtbot-paperclip-2.3.1/lib/paperclip/storage.rb:199:in `flush_writes'
# /Library/Ruby/Gems/1.8/gems/thoughtbot-paperclip-2.3.1/lib/paperclip/attachment.rb:142:in `save'

# This situation is documented by Rightscale when used along with attachment_fu, but the 
# errors generated when used with Paperclip >=2.3.1 are identical.
#
# See http://rightscale.rubyforge.org/right_aws_gem_doc/files/README_txt.html for more 
# info. 