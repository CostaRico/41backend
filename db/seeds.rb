require 'factory_girl_rails'

AdminUser.delete_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

Category.delete_all
category = {}
category['СТРОИТЕЛЬНЫЕ МАТЕРИАЛЫ'] = ['Сухие смеси и грунтовки', 'Кирпич и блоки', 'Гипсокартон и элементы монтажа', 'Кровля']
category['ОТДЕЛОЧНЫЕ МАТЕРИАЛЫ'] = ['Лакокрасочные материалы', 'Плитка, камень, мозаика', 'Обои', 'Напольные покрытия']
category['ИНСТРУМЕНТ И ОБОРУДОВАНИЕ'] = ['Электроинструмент', 'Ручной инструмент', 'Станки', 'Расходные материалы']
category['ЭЛЕКТРИКА И ОСВЕЩЕНИЕ'] = ['Розетки и выключатели', 'Электрические аксессуары', 'Кабель и монтаж', 'Трансформаторы и стабилизаторы']
category['САНТЕХНИКА, ВОДОСНАБЖЕНИЕ И ОТОПЛЕНИЕ'] = ['Сантехника', 'Водоснабжение и отопление']

category.each do |name, subcategories|
  cat = Category.create(name: name)
  subcategories.each do |sub|
    cat.categories.create(name: sub)
  end
end

Property.delete_all
 %w( Цвет
     Мощность
     Диаметр
     Материал
     Объем
     Вес
     Площадь
     Длина
 ).each do |name|
  Property.create(title: name)
end

category_all = Category.all
Category.find_by(name: 'СТРОИТЕЛЬНЫЕ МАТЕРИАЛЫ').update(property_ids: [4,5,6]) # строй материалы
Category.find_by(name: 'ОТДЕЛОЧНЫЕ МАТЕРИАЛЫ').update(property_ids: [1,4,5,6,7]) # отдел материалы
Category.find_by(name: 'ИНСТРУМЕНТ И ОБОРУДОВАНИЕ').update(property_ids: [2,4]) # инструмент и оборуд
Category.find_by(name: 'ЭЛЕКТРИКА И ОСВЕЩЕНИЕ').update(property_ids: [1,4,8]) # электрик и освещ
Category.find_by(name: 'САНТЕХНИКА, ВОДОСНАБЖЕНИЕ И ОТОПЛЕНИЕ').update(property_ids: [4,8]) # сантехни и водоснабж


%w(синий красный белый желтый зеленый).each do |color|
  Property.find_by_title("Цвет").values.create(value: color)
end

%w(Weber Bosch Makita ЗУБР DWT).each do |brand|
  Brand.create(title: brand)
end

%w(100w 200w 500w 1000w 2000w).each do |power|
  Property.find_by_title("Мощность").values.create(value: power)
end

%w(Сталь Дерево Пластик).each do |power|
  Property.find_by_title("Материал").values.create(value: power)
end

%w(10см 20см 50см).each do |power|
  Property.find_by_title("Диаметр").values.create(value: power)
end

def category_random_id
  Category.select(:id).map(&:id).sample
end

100.times do
  category = Category.find(category_random_id)
  Product.create(
      title: category.name,
      price: rand(100),
      text: 'Its a Description Its a Description Its a Description Its a Description Its a Description Its a Description',
      category_id: category.id
    )
end
