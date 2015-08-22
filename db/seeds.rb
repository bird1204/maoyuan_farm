# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first) 
p 'create news data ---> START'
data = [{title: '屁孩機車', content: '屁孩mafia的機車', category: 'new_products'},
        {title: '屁孩汽車', content: '屁孩mafia的汽車', category: 'new_products'},
        {title: '屁孩電腦', content: '屁孩mafia的電腦', category: 'discount'},
        {title: '屁孩單車', content: '屁孩mafia的單車', category: 'discount'},
        {title: '屁孩開業', content: '屁孩mafia即起營業', category: 'buisness'},
        {title: '屁孩開業', content: '屁孩趴特萬即起營業', category: 'buisness'},
        {title: 'mafia board', content: 'mafia 沒有公告可以說', category: 'board'},
        {title: '趴特萬 board', content: '趴特萬 沒有公告可以說', category: 'board'},
        {title: 'bird board', content: 'bird 有公告但不想跟你說', category: 'board'}]
New.create(data)
p 'create news data ---> DONE'

p 'create payment_methods data ---> START'
data = [{name: '現金'}, {name: '匯款'}, {name: '支票'}]
PaymentMethod.create(data)
p 'create categorys data ---> DONE'

p 'create categorys data ---> START'
data = [{name: 'mafia', description: '屁孩-mafia'},
        {name: '趴特萬', description: '屁孩-趴特萬'},
        {name: 'bird', description: '屁孩-bird'}]
Category.create(data)
p 'create categorys data ---> DONE'

p 'create products data ---> START'
data = [{name: 'mafia item_1', category_id: '1', description: 'mafia_item_1', price: 999, stock: 999, comment: 'mafia_item_1'},
{name: 'mafia item_2', category_id: '1', description: 'mafia_item_2', price: 999, stock: 999, comment: 'mafia_item_2'},
{name: 'mafia item_3', category_id: '1', description: 'mafia_item_3', price: 999, stock: 999, comment: 'mafia_item_3'},
{name: '趴特萬 item_1', category_id: '2', description: '趴特萬_item_1', price: 999, stock: 999, comment: '趴特萬_item_1'},
{name: '趴特萬 item_2', category_id: '2', description: '趴特萬_item_2', price: 999, stock: 999, comment: '趴特萬_item_2'},
{name: 'bird item_3', category_id: '3', description: 'bird_item_3', price: 999, stock: 999, comment: 'bird_item_3'},]
Product.create(data)
p 'create products data ---> DONE'
