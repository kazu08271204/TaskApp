module ApplicationHelper

  def full_title(page_name = "")
    base_title = "Task App"
    if page_name.empty?
      base_title
    else
      page_name + " | " + base_title
    end
  end


require "uri" #Railsのuriライブラリを呼び出すことで、extractメソッド(文字列からURIを抽出)を使うことができる。
 
  def content_url_to_link(content) 
 
    URI.extract(content, ["http", "https"]).uniq.each do |url| #「URI.extract」で引数の値（文字列）からURIを抽出
      content.gsub!(url, "<a href=\"#{url}\"target=\"_blank\">#{url}") #gsub!メソッドで、URLを置換
    end
    content
  end
end