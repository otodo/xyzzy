#encoding: Shift_JIS

#xyzzy���̃��C�u�����t�@�C����T���A
#���̃��C�u�������R���p�C������Ă�����̂�"site-list/library/"�t�H���_�ֈړ�

require 'fileutils'

fl = Dir.glob("**/*.l")
flc = Dir.glob("**/*.lc")

fl.each{|l|
  # ex = -1
  exlcname = ""
  lname = l.sub(/\.l$/,"")
  #office setting�͉�Ђ̃o�b�N�A�b�v�̂��ߑΏۊO�B
  #netinstaller���ΏۊO�Bsiteinit.l���p�ɂɉ������邽�ߑΏۊO
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
    # break if(l < lc) #�啶���̃\�[�g�������Ă��A���܂����삵�Ȃ����߃R�����g�A�E�g
  }
}
