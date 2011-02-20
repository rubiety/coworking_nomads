Before do
  Given %{a city "Rochester" exists with name: "Rochester"}
  Given %{a city "San Diego" exists with name: "San Diego"}
end

After do
  City.delete_all
end
