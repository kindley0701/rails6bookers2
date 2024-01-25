class ContactMailer < ApplicationMailer
  def send_when_owner_announce(user, group, notice) #メソッドに対して引数を設定
    @user = user #ユーザー情報
    @group = group #発信グループ
    @notice = notice #発信内容
    mail to: user.email, subject: '【Bookers2】 メッセージが届きました'
  end #読み終えたらメールのviewへ
end
