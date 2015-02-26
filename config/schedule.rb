every 1.day, :at => '11:59pm' do
  rake "todo:delete_items"
end