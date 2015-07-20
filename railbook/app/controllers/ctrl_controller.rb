class CtrlController < ApplicationController
        # before/afterフィルタの登録
  before_action :start_logger, only:[:index, :index2]
  before_action :auth, only: :index
  after_action :end-logger, except: :index
  around_action :around_logger

  skip_action_callback :my0]_logging

  def para
    render text: 'idパラメータ：' + params[:id]
  end
  def para_array
    render text: 'categoryパラメータ：' + params[:category].inspect
  end
  def req_head
    render text: request.headers['User-Agent'] 
  end
  def req_head2
    @headers = request,headers
  end
  def upload_process
         # アップロードファイルとを取得
    file = params[:upfile]
         # ファイルのベース名（パスを除いた部分）を取得
    name = file.original_filename
         # 許可する拡張子を定義
    perms = ['.jpg', '.jpeg', '.gif', '.png']
         # 配列permsにアップロードファイルの拡張子に合致するものがあるか
    if !perms.include?(File.extname(name).downcase)
      result = 'アップロードできるのは画像ファイルのみです。'
         # アップロードファイルのサイズが１MB以下であるか
    elsif file.size > 1.megabyte
      result 'ファイルサイズは１MBまでです。'
    else
         # ファイル名をUTF8→Shift-jisにエンコード
      name = name.kconv(Kconv::SJIS, Kconv::UTF8)
         # /public/docフォルダ配下にアップロードファイルを保存
      File.open("public/docs/#{name}", 'wb'){ |f| f.write(file.read) }
      result = "#{name.toutf8}をアップロードしました。"
    end
         # 成功/エラーメッセージを保存
    render text::result
  end
  def upload_process
    @author = Author.find(params[:id])
    if @author.update(params.require(:author).permit(:date))
      render text: '保存に成功しました。'
    else
      render text: @author.errors.full_message[0]
    end
  end
  def show_photo
          # ルートパラメータで指定されている場合はその値を、さもなければ1をセット
    id = params[:id] ? params[:id] : 1
          # authorsテーブルからid値をキーにレコードを取得
    @author = Author.find(id)
          # photo配列（バイナリ型を）レスポンスとして送出
    send_data @author.photo, type: @auhtor.ctype, disposition: :inline
  end
  def log
    logger.unknown('unknown')
    logger.fatal('fatal')
    logger.error('error')
    logger.warn('warn')
    logger.info('info')
    logger.debug('debug')
    render text: 'ログはコンソール、またはログファイルから確認ください。')
  end
  def get_xml
    @books = Book.all
    render xml: @books
  end
  def get_json
    @books = Books.all
    render json: @books
  end
  def download
    @books = Book.all
  end

  def index
    sleep 3
    render text: 'indexアクションが実行されました。'
  end

  private
        # 開始時刻をログに記憶
  def start_logger
    logger.debug('{Start}' + Time.now.to_s)
  end

        # 終了時刻をログに記憶
  def end_logger
    logger.debug('{Finish}' + Time.now.to_s)
  end

  def around_logger
    logger.debug('{Start}' + Time.now.to_S)
    yield
    logger.debug('{Finish}' + Time.now.to_s)
  end

  def auth
        # 認証に利用するユーザ名/パスワード
    name = 'yyamada'
    passwd = '8cb2237d8679ca88db6464eac60da96345513964'
        # 基本認証を実行（入力されたユーザ名、パスワードをname,passwdと比較）
    authenticate_or_request_with_http_basic('Railbook') do |n, p|
      n == name &&
        Digest::SHA1.hexdigest(p) == passwd
    end
  end

end
