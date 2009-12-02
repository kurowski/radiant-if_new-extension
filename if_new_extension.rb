# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class IfNewExtension < Radiant::Extension
  version "1.0"
  description "Condition tag that checks publication date"
  url "http://github.com/kurowski/radiant-if_new-extension"
    
  def activate
    Page.send :include, IfNewTag
  end
  
  def deactivate
  end  
end
