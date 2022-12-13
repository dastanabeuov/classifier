json.array!(@xclasses) do |xclass|
  json.id xclass.id.to_s
  json.text xclass.title
  json.parent xclass.root? ? "#" : xclass.ancestry.split("/").last

  json.state do
    json.opened true
  end
end