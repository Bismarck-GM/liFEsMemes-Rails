Category.create name: 'Gaming', priority: 1, image: 'https://www.fosi.org/media/images/22601782810_cbe3ede5f5_o.focus-none.original.jpg'
Category.create name: 'Classic', priority: 2, image: 'https://ligalive.net/wp-content/uploads/2020/03/no-football-on-tv-corona-meme-1200x1200.png'
Category.create name: 'New', priority: 3, image: 'https://duffy.agency/wp-content/uploads/2019/05/example-of-Dos-Equis-meme.png'
Category.create name: 'Programming', priority: 4, image: 'https://digitalsynopsis.com/wp-content/uploads/2018/10/funny-memes-for-designers-2.jpg'
bender = User.create name: 'Bender', email: 'bender@futurama.com', password: '123456', password_confirmation: '123456'
fry = User.create name: 'Fry', email: 'fry@futurama.com', password: '123456', password_confirmation: '123456'
leela = User.create name: 'Leela', email: 'leela@futurama.com', password: '123456', password_confirmation: '123456'
article1 = bender.articles.create title: 'Bender', text: 'I\'m the greatest character ever created. Bite my shiny metal ass', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'bender-drink.jpg')), category_ids: [1, 2, 3, 4]

bender.voted_articles << article1
fry.voted_articles << article1
leela.voted_articles << article1

bender.articles.create title: 'AI', text: 'Much technology', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'pmeme1.png')), category_ids: 4
fry.articles.create title: 'Front End', text: 'Let them get closer.', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'pmeme3.png')), category_ids: 4
bender.articles.create title: 'Experienced enough?', text: 'You will never fill the requirements', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'pmeme4.png')), category_ids: 4
bender.articles.create title: 'Lorem Ipsum', text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque erat quam, scelerisque quis diam at, pretium convallis mauris. Morbi rutrum, justo a condimentum pellentesque, neque nisi finibus arcu, in vulputate magna leo ornare augue. Curabitur ut consectetur velit. Proin efficitur enim sit amet nulla sodales sagittis. Quisque tempus venenatis ex, interdum vestibulum mi posuere bibendum. Curabitur in est mattis massa maximus consectetur vitae at leo. Aliquam faucibus libero libero, sit amet rutrum felis pulvinar ut. Fusce imperdiet, magna vel accumsan blandit, tellus nisl porta nibh, sit amet vestibulum lectus nisl eu tellus. Pellentesque feugiat risus ac leo cursus, in vestibulum libero eleifend. Integer auctor enim nulla, eu gravida nibh tincidunt ut. Maecenas dictum venenatis nibh, sed posuere quam maximus in. Sed euismod tincidunt sapien, in dapibus orci interdum et. Integer finibus tortor non tortor tempor volutpat. Fusce dictum fermentum felis, pretium dapibus ex eleifend malesuada. Donec et felis a nisl sollicitudin malesuada. Phasellus arcu lectus, ultrices nec bibendum in, faucibus.', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'loremipsum.png')), category_ids: 4
bender.articles.create title: 'Front End', text: 'What does DIV even mean?', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'pmeme2.jpg')), category_ids: 4

fry.articles.create title: 'Commie teammate', text: 'Theres no team in I', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'gmeme1.jpg')), category_ids: 1
bender.articles.create title: 'That scalated quickly', text: 'Please dont\'t shoot me', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'gmeme2.jpg')), category_ids: 1
bender.articles.create title: 'Gamer types', text: 'Which one are you?', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'gmeme3.jpg')), category_ids: 1
leela.articles.create title: 'Good guy', text: 'He\'s just for the business', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'gmeme4.jpg')), category_ids: 1
leela.articles.create title: 'Time to game', text: 'Unless the sun is out', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'gmeme5.jpg')), category_ids: 1
bender.articles.create title: 'Hardcore kinder', text: 'We all sweated while playing', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'gmeme6.jpg')), category_ids: 1

bender.articles.create title: 'Genius', text: 'Please go', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'cmeme1.jpg')), category_ids: 2
fry.articles.create title: 'NO WAY!', text: 'it\'s quite accurate though!', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'cmeme2.jpg')), category_ids: 2
bender.articles.create title: 'WHY DON\'T YOU', text: 'PLEASE', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'cmeme3.jpg')), category_ids: 2
leela.articles.create title: 'This is fine', text: 'Trust me', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'cmeme4.jpg')), category_ids: 2
fry.articles.create title: 'Mmmmmm', text: 'Be preppared', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'cmeme5.jpg')), category_ids: 2

bender.articles.create title: 'I hear you didn\'t like graffitis', text: 'Inception comming', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'nmeme1.png')), category_ids: 3
fry.articles.create title: 'He won\'t notice it', text: 'damn', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'nmeme2.jpg')), category_ids: 3
bender.articles.create title: 'Playing the player', text: 'That gotta hurt', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'nmeme3.jpg')), category_ids: 3
leela.articles.create title: 'Too real', text: 'It is', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'nmeme4.jpg')), category_ids: 3
leela.articles.create title: 'Cheems!', text: 'But we can really play games now', image: File.new(Rails.root.join('app', 'assets', 'images', 'demo', 'nmeme5.jpg')), category_ids: 3