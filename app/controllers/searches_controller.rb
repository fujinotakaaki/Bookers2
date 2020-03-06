class SearchesController < ApplicationController
  def search
    # 条件と検索用文字列の取得
    conditional_expressions, search_words = cteate_argument
    # 変数名の決定
    parameter_name = ?@ + params[:model].downcase + ?s
    # 条件式の構築
    conditional_expression = ?" + conditional_expressions.join( ' or ' ) + ?"
    # 検索ワードの列挙
    search_words_enumeration = ?" + search_words.join( %q{", "} ) + ?"
    # 検索結果の取得
    eval( %$#{parameter_name} = #{ params[:model] }.where( #{ conditional_expression }, #{ search_words_enumeration } ) $ )
    # 本の新規投稿用の変数
    @book_new = Book.new
    # Books#indexで必要な変数の設定
    if params[:model] == 'Book' then
      @favorites = current_user.favorites
    end
    # 遷移先の定義
    render "#{params[:model].downcase}s/index"
  end

  private
  def cteate_argument
    # 検索対象モデルの検索対象カラムの格納
    columns = case params[:model]
    when 'User' then
      ["name", "introduction"]
    when 'Book' then
      ["title", "body"]
    end

    # 関係演算子の決定と検索用文字列の書式構築
    relational_operator, search_word = case params[:requirement]
    when 'all' then
      [ '=', params[:keyword] ]
    when 'front' then
      [ 'LIKE', "#{params[:keyword]}%" ]
    when 'back' then
      [ 'LIKE', "%#{params[:keyword]}" ]
    when 'pertial' then
      [ 'LIKE', "%#{params[:keyword]}%" ]
    end
    # 条件式の構築
    conditional_expressions = columns.map{ |column| "#{column} #{relational_operator} ?" }
    # 条件と検索用文字列を配列情報として返す
    return conditional_expressions, Array.new( columns.size, search_word )
  end
end
