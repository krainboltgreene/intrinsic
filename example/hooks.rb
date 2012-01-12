require 'intrinsic'

class Company
  include Intrinsic

  property :title, String
  property :slug, Proc,  after_initialize: ->(company) { slug company.title.downcase.gsub(' ', '-') }
  property :views, Integer, default: 0, after_initialize: :link_to_account
end

p page = Page.new.title("Little Red Ridding Hood")
# => #<Page:2157011700 title="Little Red Ridding Hood", slug=#<Proc:0x0000010122c818@example/default_values.rb:7 (lambda)>, views=0>
p page.slug
# => "little-red-ridding-hood"
p page.slug ->(page) { page.title.upcase.gsub ' ', '-' }
# => #<Page:2156971000 title="Little Red Ridding Hood", slug=#<Proc:0x00000101217e68@example/default_values.rb:15 (lambda)>, views=0>
p page.slug
# => "LITTLE-RED-RIDDING-HOOD"
