class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :toUserName
      t.string :fromUserName
      t.string :createTime
      t.string :msgType
      t.string :content
      t.string :musicUrl
      t.string :hqMusicUrl

      #image and text
      t.string :articleCount
      t.string :articles
      t.string :title
      t.string :description
      t.string :picUrrl
      t.string :url

      t.timestamps
    end
  end
end
