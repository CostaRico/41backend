module Api
	class CategoriesController < ApplicationController
		def index

			cats = [
				{
					id: 1,
					name: 'Стройматериалы',
					url: 'sdfsdf',
					parent_id: nil,
					img_url: 'sdfsdf',
					icon_class: 'fa-xxx'
				},
				{
					id: 2,
					name: 'Отделочные материалы',
					url: 'sdfsdf',
					parent_id: nil,
					img_url: 'sdfsdf',
					icon_class: 'fa-xxx'
				},
				{
					id: 3,
					name: 'Сантехника, отопление и водоснабжение',
					url: 'sdfsdf',
					parent_id: nil,
					img_url: 'sdfsdf',
					icon_class: 'fa-xxx'
				},
				{
					id: 4,
					name: 'Электрика и освещение',
					url: 'sdfsdf',
					parent_id: nil,
					img_url: 'sdfsdf',
					icon_class: 'fa-xxx'
				},
				{
					id: 5,
					name: 'Гипсокартонные системы',
					parent_id: 1,
				},
				{
					id: 6,
					name: 'Сухие смеси',
					parent_id: 1,
				},
				{
					id: 7,
					name: 'Фасадные системы',
					parent_id: 1,
				},
				{
					id: 8,
					name: 'Теплоизоляция',
					parent_id: 1,
				},
				{
					id: 9,
					name: 'Гидроизоляци',
					parent_id: 1,
				},

			]

			render json: cats
		end
	end
end
