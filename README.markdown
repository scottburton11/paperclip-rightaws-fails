What
====

This sample project demonstrates the error(s) generated when Paperclip 2.3.1, which switched to the AWS/S3 gem, and the RightScale RightAWS gem are both loaded in the Rails initializer block.

In order to get Paperclip working alongside RightAWS, you need to load it in an after_initialize block, demonstrated in this project's environment.rb. However, this precludes you from loading Rails models which inherit from RightAWS, or from using "require 'right_aws'" anywhere else in your project - like in a plugin, for example. 


How
===

RightAWS argument error when Paperclip is loaded, relavent portion of the stack trace

> ArgumentError (wrong number of arguments (5 for 4)):
> 
> /Library/Ruby/Gems/1.8/gems/right_http_connection-1.2.4/lib/net_fix.rb:85:in `send_request_with_body_stream'
> /Library/Ruby/Gems/1.8/gems/right_http_connection-1.2.4/lib/net_fix.rb:85:in `exec'
> /Library/Ruby/Gems/1.8/gems/right_http_connection-1.2.4/lib/net_fix.rb:144:in `request'
> /Library/Ruby/Gems/1.8/gems/aws-s3-0.6.2/lib/aws/s3/connection.rb:45:in `request'
> /Library/Ruby/Gems/1.8/gems/aws-s3-0.6.2/lib/aws/s3/connection.rb:52:in `request'
> /Library/Ruby/Gems/1.8/gems/aws-s3-0.6.2/lib/aws/s3/base.rb:69:in `request'
> /Library/Ruby/Gems/1.8/gems/aws-s3-0.6.2/lib/aws/s3/base.rb:88:in `put'
> /Library/Ruby/Gems/1.8/gems/aws-s3-0.6.2/lib/aws/s3/object.rb:241:in `store'
> /Library/Ruby/Gems/1.8/gems/thoughtbot-paperclip-2.3.1/lib/paperclip/storage.rb:202:in `flush_writes'
> /Library/Ruby/Gems/1.8/gems/thoughtbot-paperclip-2.3.1/lib/paperclip/storage.rb:199:in `each'
> /Library/Ruby/Gems/1.8/gems/thoughtbot-paperclip-2.3.1/lib/paperclip/storage.rb:199:in `flush_writes'
> /Library/Ruby/Gems/1.8/gems/thoughtbot-paperclip-2.3.1/lib/paperclip/attachment.rb:142:in `save'


Why
===

This situation is documented by Rightscale when used along with attachment_fu, but the errors generated when used with Paperclip >=2.3.1 are identical.

See http://rightscale.rubyforge.org/right_aws_gem_doc/files/README_txt.html for more 
info.


Which
=====

* thoughtbot-paperclip 2.3.1
* right_aws 1.10.0