#encoding: Shift_JIS

#xyzzy中のライブラリファイルを探し、
#そのライブラリがコンパイルされているものを"site-list/library/"フォルダへ移動

require 'fileutils'

fl = Dir.glob("**/*.l")
flc = Dir.glob("**/*.lc")

fl.each{|l|
  # ex = -1
  exlcname = ""
  lname = l.sub(/\.l$/,"")
  #office settingは会社のバックアップのため対象外。
  #netinstallerも対象外。siteinit.lも頻繁に改訂するため対象外
  if(lname =~ /office setting\/|ni\/|ni-autoload\/|siteinit/) 
    # ex = 1
    next
  end
  flc.each{|lc|
    lcname = lc.sub(/\.lc$/,"")
    if(lname == lcname)
      # ex = 1
      exlcname = lc
      puts (l+", "+lc)
      FileUtils.mv(l,'site-lisp/library/')
      break
    end
    # break if(l < lc) #大文字のソートをかけても、うまく動作しないためコメントアウト
  }
}
