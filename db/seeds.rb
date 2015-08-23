# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first) 
p 'create news data ---> START'
data = [{title: '屁孩機車', content: '屁孩mafia的機車', category: '新品上市'},
        {title: '屁孩汽車', content: '屁孩mafia的汽車', category: '新品上市'},
        {title: '屁孩電腦', content: '屁孩mafia的電腦', category: '特價資訊'},
        {title: '屁孩單車', content: '屁孩mafia的單車', category: '特價資訊'},
        {title: '屁孩開業', content: '屁孩mafia即起營業', category: '營業訊息'},
        {title: '屁孩開業', content: '屁孩趴特萬即起營業', category: '營業訊息'},
        {title: 'mafia board', content: 'mafia 沒有公告可以說', category: '站務公告'},
        {title: '趴特萬 board', content: '趴特萬 沒有公告可以說', category: '站務公告'},
        {title: 'bird board', content: 'bird 有公告但不想跟你說', category: '站務公告'}]
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
data = [{name: 'mafia item_1', category_id: '1', description: 'DESC mafia_item_1', price: 999, stock: 999, comment: 'mafia_商品_1的說明'},
{name: 'mafia item_2', category_id: '1', description: 'DESC mafia_item_2', price: 999, stock: 999, comment: 'mafia_商品_2的說明'},
{name: 'mafia item_3', category_id: '1', description: 'DESC mafia_item_3', price: 999, stock: 999, comment: 'mafia_商品_3的說明'},
{name: '趴特萬 item_1', category_id: '2', description: 'DESC 趴特萬_item_1', price: 999, stock: 999, comment: '趴特萬_商品_1的說明'},
{name: '趴特萬 item_2', category_id: '2', description: 'DESC 趴特萬_item_2', price: 999, stock: 999, comment: '趴特萬_商品_2的說明'},
{name: 'bird item_3', category_id: '3', description: ' DESC bird_item_3', price: 999, stock: 999, comment: 'bird_商品_3的說明'},]
Product.create(data)
p 'create products data ---> DONE'
