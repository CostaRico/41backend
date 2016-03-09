require 'factory_girl_rails'

AdminUser.delete_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Category.delete_all
%w( стартер-кит
    мод
    атомайзер
    EGO
    жидкость
    проволока
    сменный испаритель
    другое
).each do |name|
  Category.create(name: name)
end

Property.delete_all
 %w( Цвет
     Бренд
     Мощность
     Сопротивление
     МинимальноеСопротивление
     Диаметр
     Материал
     Термоконтроль
 ).each do |name|
  Property.create(title: name)
end

%w(синий красный белый желтый зеленый).each do |color|
  Property.find_by_title("Цвет").values.create(value: color)
end

%w(Сони Феррари Меркури Саоми Гугл).each do |brand|
  Property.find_by_title("Бренд").values.create(value: brand)
end

%w(1w 2w 5w 10w 20w).each do |power|
  Property.find_by_title("Мощность").values.create(value: power)
end

%w(Сталь Дерево Пластик).each do |power|
  Property.find_by_title("Материал").values.create(value: power)
end

%w(1см 2см 5см).each do |power|
  Property.find_by_title("Диаметр").values.create(value: power)
end

def category_random_id
  Category.select(:id).map(&:id).sample
end

100.times do
  Product.create(
      title: 'Title',
      price: rand(100),
      text: 'Its a Description Its a Description Its a Description Its a Description Its a Description Its a Description',
      category_id: category_random_id
    )
end


# FactoryGirl.define do
#   factory :product do
#     title "John"
#     text  "Doe"
#     price 120
#     category_id "#{rand(1..8)}"
#   end
# end
