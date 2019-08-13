category_names =
%w(
  アート・写真
  音楽
  舞台・パフォーマンス
  プロダクト
  テクノロジー・ガジェット
  ゲーム・サービス開発
  フード・飲食店
  ファッション
  映像・映画
  書籍・雑誌出版
  アニメ・漫画
  スポーツ
  ビジネス・起業
  ソーシャルグッド
  ビューティー・ヘルスケア
  まちづくり・地域活性化
  チャレンジ
)

category_names.each do |category_name|
  Category.find_or_create_by!(name: category_name)
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?