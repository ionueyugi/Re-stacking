# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#管理者
Admin.create!(email: "admin@example.jp",
             password:  "111111")
# id1　満点の時
Result.create!(result_content: "大変素晴らしいです！！　この調子で継続する癖をつけましょう。")

# id2　8~11点
Result.create!(result_content: "いいペースです！　生活にリズムが生まれてきたのではないでしょうか？　満足していない部分の評価が低い理由を分析してみましょう！次は満点がつくように工夫してみてください。")

# id3　3~7点の時
Result.create!(result_content: "あと少し！！目標を達成したり、決めたことを継続するには分析が必要不可欠です！　次はいい結果をつけることができるように分析してみましょう！")

# id4 0点がある時
Result.create!(result_content: "極端に評価が低いところが目立ちますね。　目標の設定値や一度でこなす量が多いのかもしれませんね。もう一度よく考え目標を設定しましょう！")

