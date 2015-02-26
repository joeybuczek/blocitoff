every 1.day, :at => '10:45pm' do
  rake "todo:delete_items"
end