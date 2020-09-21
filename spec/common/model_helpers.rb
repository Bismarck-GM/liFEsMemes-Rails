require 'faker'

module ModelHelpers
  def article_data
    {
      title: Faker::Lorem.sentence,
      text: Faker::Lorem.paragraph,
      image: File.new(Rails.root.join('app', 'assets', 'images', 'LifesMemesBrownBackground-01-01.png'))
    }
  end

  def user_data
    {
      email: Faker::Internet.email,
      name: Faker::Name.name,
      password: '123456',
      password_confirmation: '123456'
    }
  end

  def category_data
    {
      name: Faker::Lorem.sentence,
      image: Faker::LoremPixel.image,
      priority: Faker::Number.between(from: 1, to: 1000)
    }
  end

end