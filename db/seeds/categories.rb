categories = [
  {
    name: {
      ua: "Фурі",
      ru: "Фурри",
      en: "Furry",
      de: "Pelzig"
    }
  }
]

categories.each do |category|
  attributes = {
    name_ua: category[:name][:ua],
    name_ru: category[:name][:ru],
    name_en: category[:name][:en],
    name_de: category[:name][:de]
  }

  SeedsHelper.create_category!(attributes)
end