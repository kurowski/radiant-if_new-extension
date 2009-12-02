module IfNewTag
  include Radiant::Taggable
  
  desc "Shows tag contents if the publication date is recent"
  tag "if_new" do |tag|
    days = (tag.attr['days'] || '5').to_i
    if tag.locals.page.published_at > days.days.ago
      tag.expand
    end
  end
end