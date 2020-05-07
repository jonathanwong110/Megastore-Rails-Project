User.create(username:"JW", email: "123@testing.com", password: "12345")
User.create(username:"OM", email: "123@testing.com", password: "12345")
User.create(username:"CL", email: "123@testing.com", password: "12345")
User.create(username:"KL", email: "123@testing.com", password: "12345")

Cart.create(user_id: 1)
Cart.create(user_id: 2)
Cart.create(user_id: 3)
Cart.create(user_id: 4)

Product.create(title: "hat", price: 5, description: "new", image: "https://dmp0bw3rmgwlj.cloudfront.net/catalog/product/cache/2d30c628ca84d1fb5bde9dd708affbe5/r/1/r11_teastain_b_1.jpg", category: "Apparel", user_id: 1)
Product.create(title: "t-shirt", price: 10, description: "new", image: "https://lp2.hm.com/hmgoepprod?set=quality[79],source[/b3/49/b349d9e57192a24357906baa2ac8d29ef255eb98.jpg],origin[dam],category[men_tshirtstanks_shortsleeve],type[DESCRIPTIVESTILLLIFE],res[m],hmver[1]&call=url[file:/product/main]", category: "Apparel", user_id: 1)
Product.create(title: "scarf", price: 10, description: "new", image: "https://www.fjallraven.com/globalassets/catalogs/fjallraven/f7/f780/f78011/f020/7323450521189_fw19_a_solid_rewool_scarf_fjaellraeven_21.jpg?width=2000&height=2000&mode=BoxPad&bgcolor=fff&quality=80", category: "Apparel", user_id: 2)
Product.create(title: "jacket", price: 40, description: "new", image: "https://images-na.ssl-images-amazon.com/images/I/71vpN1h03PL._AC_UY679_.jpg", category: "Apparel", user_id: 2)

UserProduct.create(user_id: 1, product_id: 1)
UserProduct.create(user_id: 1, product_id: 1)
UserProduct.create(user_id: 2, product_id: 2)
UserProduct.create(user_id: 2, product_id: 2)

Review.create(content: "The item came in amazing condition", user_id: 1, product_id: 4)
Review.create(content: "The user shipped it earlier than expected. I would recommend anyone check out this user!", user_id: 2, product_id: 3)
Review.create(content: "Best item I've ever bought online! ", user_id: 3, product_id: 2)
Review.create(content: "I've gotten many compliments on this!", user_id: 4, product_id: 1)
