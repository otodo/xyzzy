("name" . "xyzzy�̂�����")
("author" . "miyamuko")
("url" . "http://miyamuko.s56.xrea.com/")
("description" . "�ǂ��ł������X�N���v�g�Ƃ�")
("packages" (("name" . "xl-pik") ("version" . "1.0.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xl-pik.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xl-pik.zip") ("description" . "xl-pik �� [Pik] ���g���� xyzzy ���痘�p���� Ruby ��؂�ւ��邽�߂̃c�[���ł��B

Pik ���g���� Windows ���ɕ����o�[�W������ Ruby ���C���X�g�[�����āA
�؂�ւ��ė��p���邱�Ƃ��ł��܂��B

xl-pik ���g�����Ƃ� Pik �ɂ���Đ؂�ւ������ϐ��� xyzzy �ɔ��f���邱�Ƃ��ł��܂��B
xl-pik �� Ruby ��؂�ւ������ `C-x &` �� `C-x |` �� `C-x c` �ȂǊO���R�}���h��
���s���鏈���S�Ăɔ��f����܂��B

**����: xl-pik �� xyzzy 0.2.2.235 �ł͗��p�ł��܂���B**
�ȉ��̂ǂ��炩�̃o�[�W�����𗘗p���Ă��������B

  * [xyzzy 0.2.2.236 �ȍ~]
  * [xyzzy 0.2.3.3 �ȍ~]


  [Pik]: https://github.com/vertiginous/pik
  [xyzzy 0.2.2.236 �ȍ~]: http://xyzzy-022.github.com
  [xyzzy 0.2.3.3 �ȍ~]: https://bitbucket.org/mumurik/xyzzy/wiki/Home") ("category" "Utilities" "Development") ("md5" . "5f0b41aa6f947b4d0177dda1a2a51e09") ("time" . 3542098464) ("depends" "ansify") ("changes" . "### 2012-03-30 / 1.0.0

xl-pik 1.0.0 released!

  * ����") ("notice") ("load-after-install") ("load-before-uninstall")) (("name" . "xl-open-uri") ("version" . "1.0.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xl-open-uri.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xl-open-uri.zip") ("description" . "xl-open-uri �� Ruby �� [open-uri] �Ƃقړ��l�̋@�\�� xyzzy Lisp �Ɏ����������C�u�����ł��B
HTTP �� FTP �ɊȒP�ɃA�N�Z�X���邽�߂̋@�\��񋟂��܂��B

�f�t�H���g�ŃT�|�[�g���Ă��� URL �X�L�[���� http, https, ftp, data �ł��B
�܂��AURL �X�L�[����ǉ����邽�߂� API �����J���Ă��܂��B

Ruby �� open-uri �ł� HTTP GET ����� FTP �̃_�E�����[�h�����Ή����Ă��܂��񂪁A
xl-open-uri �ł͔C�ӂ� HTTP ���\�b�h�̑��M���\�ł��B
�܂� FTP �̃A�b�v���[�h�ɂ��Ή����Ă��܂��B

  [open-uri]: http://doc.ruby-lang.org/ja/1.9.3/library/open=2duri.html
") ("category" "Network" "Libraries" "Development") ("md5" . "3243520bd298368c9bd6afe7c55a12e5") ("time" . 3537946975) ("depends" "http-client" "xl-winhttp" "xl-alexandria" "ansi-loop" "ansify" "setf-values") ("changes" . "���Ń����[�X") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "http-client") ("version" . "1.0.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "http-client.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/http-client.zip") ("description" . "http-client �� [xl-winhttp] �𗘗p���� HTTP �N���C�A���g�E���C�u�����ł��B
Proxy�ABasic/Digest �F�؁ASSL�ACookie�A�񓯊��ʐM�Ȃǂ��T�|�[�g���Ă��܂��B

[xml-http-request] �Ɣ�r���������b�g�E�f�����b�g�͂��ꂼ��ȉ��̂Ƃ���ł��B

  * �����b�g
    * �X�g���[�~���O�ɑΉ����Ă��� (Transfer-Encoding: chunked)
    * Content-Type �� charset ���s���ȏꍇ�ł������������Ȃ�
    * �o�C�i���E�f�[�^�̑���M�ɑΉ����Ă���
    * �t�@�C���E�_�E�����[�h�ɑΉ����Ă���
    * �t�@�C���E�A�b�v���[�h�ɑΉ����Ă��� (multipart/form-data)
    * IE �ƃZ�b�V��������������Ă���̂ŁAIE �̃L���b�V����N�b�L�[�̉e�����󂯂Ȃ�

  * �f�����b�g
    * IE �Ƃ͕ʂɃv���L�V�� WinHTTP �Őݒ肵�Ă����K�v������
    * IE �ƃZ�b�V��������������Ă���̂ŁA���O�Ń��O�C�������Ȃǂ���������K�v������
    * �N�b�L�[�� xyzzy ���ċN������Ƃ��ׂď�����
    * �F�؏��͖���w�肷��K�v������
      - �����I�ɔF�؃_�C�A���O���łȂ�
      - �F�؏��̃L���b�V���͍s��Ȃ�
    * ���k�]���ɑΉ����Ă��Ȃ� (Content-Encoding: gzip)
    * ��M������ xyzzy Lisp �ōs�����ߎ኱�x��

  [xl-winhttp]: http://miyamuko.s56.xrea.com/xyzzy/xl-winhttp/intro.htm
  [xml-http-request]: http://miyamuko.s56.xrea.com/xyzzy/xml-http-request/intro.htm
") ("category" "Network" "Libraries" "Development") ("md5" . "6b6fc035942729dc948c514bd07a61a9") ("time" . 3537688464) ("depends" "xl-winhttp" "xl-alexandria" "ansi-loop" "ansify" "setf-values") ("changes" . "���Ń����[�X") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xl-winhttp") ("version" . "1.0.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xl-winhttp.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xl-winhttp.zip") ("description" . "xl-winhttp �� [Windows HTTP Services](http://msdn.microsoft.com/en-us/library/windows/desktop/aa384273.aspx)
�𗘗p���� HTTP �ʐM���s�����߂̃��C�u�����ł��B

[xml-http-request](http://miyamuko.s56.xrea.com/xyzzy/xml-http-request/intro.htm)
�Ɣ�ׂĒ჌�x���ȃ��C�u�����ł����Axml-http-request �ł͎擾�o���Ȃ������ȉ��̂悤�ȃf�[�^���擾�\�ł��B

  * �`�����N�`���̃G���R�[�f�B���O (Transfer-Encoding: chunked)
  * �o�C�i���t�@�C���̎擾
  * �����G���R�[�f�B���O�������I�ɕϊ����Ȃ����߁Acharset �Ȃǂ��s�K�؂ł������������܂���

Proxy �� Basic/Digest �F�؁ASSL�A�񓯊��ʐM�Ȃǂ� xml-http-request �Ɠ��l�ɑΉ����Ă��܂��B
") ("category" "Network" "Libraries" "Development") ("md5" . "7c848750ad0af9cea30c00a8b3d3b40d") ("time" . 3537688440) ("depends" "xl-alexandria" "ansi-loop" "ansify" "setf-values") ("changes" . "���Ń����[�X") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xml-http-request") ("version" . "1.3.2") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xml-http-request.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xml-http-request.zip") ("description" . "xml-http-request - �񓯊� HTTP �ʐM���C�u����
http://miyamuko.s56.xrea.com/xyzzy/xml-http-request/intro.htm") ("category" "Network" "Libraries" "Development") ("md5" . "3ac01d65997774382b8b406d46fdfa40") ("time" . 3536910309) ("depends") ("changes" . "### 2012-01-30 / 1.3.2

xml-http-request 1.3.2 �����[�X!

#### �V�K�@�\

  * �Ȃ�

#### ��݊����܂ޕύX�_

  * �Ȃ�

#### �o�O�C��

  * xhr-(get|post)-async �� :key �� xhr-response-text �Ƃ��w�肵�Ă��
    :onabort �̋N�����ɂ���������C��
    (Reported by @youz)

#### ���̑�

  * �Ȃ�
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ansi-loop") ("version" . "1.0.1") ("author" . "MIYAMUKO Katsuyuki") ("file" . "ansi-loop.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/ansi-loop.zip") ("description" . "ansi-loop �� Macintosh Common Lisp ( http://code.google.com/p/mcl/ ) ��
loop �}�N�� (loop.lisp �� extended-loop.lisp) �� xyzzy �ɈڐA�������̂ł��B

xyzzy �t���� cmu_loop.l �͏����o�O���Ă���̂ŁACommon Lisp �̃��C�u�������ڐA����ꍇ�Ȃǂ�
�s�s����������ꍇ������܂����Aansi-loop ���g���Ή������邩������܂���B
") ("category" "Libraries" "Development") ("md5" . "18ba7e43161985bdfb10182faec57d9d") ("time" . 3536910292) ("depends" "ansify") ("changes" . "### 2012-01-30 / 1.0.1

ansi-loop 1.0.1 �����[�X!

#### �V�K�@�\

  * �Ȃ�

#### ��݊����܂ޕύX�_

  * �Ȃ�

#### �o�O�C��

  * ed:lisp-indent-hook ��ݒ�

  * destructuring-bind �Ȃǈꕔ import ���Y��Ă����̂��C��

  * print-unreadable-object ������`�� loop-universe ��
    print-function �������Ă��Ȃ������̂��C��

#### ���̑�

  * ansify �Ɉˑ�����悤�ɂȂ�܂����̂ŃC���X�g�[�����Ă��������B
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xl-alexandria") ("version" . "0.0.2") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xl-alexandria.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xl-alexandria.zip") ("description" . "xl-alexandria �� Common Lisp �� Alexandria ( http://common-lisp.net/project/alexandria/ ) ��
�� xyzzy �ɈڐA�������̂ł��B

Alexandria �͋���ȃ��[�e�B���e�B�W�ł��B
���H Common Lisp �� OnLisp �ɍڂ��Ă�����A�����ŏ��������Ƃ�����悤��
�֐��E�}�N������ʂɋl�܂��Ă��܂��B
") ("category" "Libraries" "Lisp") ("md5" . "d7df943941f93f6869638346753451f0") ("time" . 3535185958) ("depends" "setf-values" "ansi-loop" "ansify") ("changes" . "xl-alexandria 0.0.2 �����[�X!

  * parse-body �� interactive �������o����悤�ɂȂ�܂��� (by @bowbow99)�B

    (ansify:destructuring-bind (defun name lambda-list &rest body)
        '(defun foobar-region (start end)
          \"foobar region\"
          (interactive \"*r\")
          (delete-region start end)
          (insert \"foobar\"))
      (alexandria:parse-body body :documentation t :interactive t))
    ;=> ((delete-region start end) (insert \"foobar\"))
    ;   nil
    ;   \"foobar region\"
    ;   (interactive \"*r\")

  * symbolicate �����삵�Ă��Ȃ������̂��C��

    (alexandria:symbolicate \"prefix-\" :foo)
    ;=> prefix-foo

  * upstream �̕ύX����荞�� (3eacfac87b2...77b219a8361)
    https://github.com/miyamuko/xl-alexandria/compare/3eacfac87b27654f7ca9eeaf1ce40344b8136b03...77b219a8361b9549aeb8941afc945fa2e3c84eb9
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xl-interpol") ("version" . "1.0.2") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xl-interpol.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xl-interpol.zip") ("description" . "xl-interpol �� CL-INTERPOL ( http://weitz.de/cl-interpol/ ) �� xyzzy �ɈڐA�������̂ł��B

xl-interpol �͈ȉ��̋@�\��񋟂��Ă��܂��B

* �ϐ��⎮�𕶎���ɖ��ߍ��߂�
* ���K�\�����e����
* ���j�R�[�h���� (\\N{HIRAGANA LETTER A})
") ("category" "Text Processing" "Libraries") ("md5" . "a7f7b0806cb120c08279bcfbc095d69d") ("time" . 3526258386) ("depends" "xl-ppcre" "ansi-loop") ("changes" . "=== 2011/09/29

* 1.0.2 �����[�X!
  * xl-interpol �Ǝ������̃��C�Z���X�� MIT �ɂȂ��Ă����̂� BSD �œ���
  * ansi-loop ���g���� cl-interpol �I���W�i���̃R�[�h�ɖ߂���
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xl-ppcre") ("version" . "1.0.1") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xl-ppcre.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xl-ppcre.zip") ("description" . "xl-ppcre �� CL-PPCRE ( http://weitz.de/cl-ppcre/ ) �� xyzzy �ɈڐA�������̂ł��B

xl-ppcre �͈ȉ��̋@�\��񋟂��Ă��܂��B

* Perl �݊��̐��K�\�����g���܂� (�ꕔ����������܂�)
* �V���O�����C�����[�h�A�}���`���C�����[�h�A�g�����K�\��
* cl-ppcre �݊��� API

xl-ppcre �͈ȉ��̋@�\�͒񋟂��Ă��܂���B

* �m���ǂ݁A�ے��ǂ݁A���ߍ��݃R�[�h�Ȃǂ͏����ł��܂���
  * xl-ppcre �� Perl �݊��̐��K�\���� xyzzy �p�ɕϊ�����݂̂ŁA
    ���K�\���G���W���� xyzzy �g�ݍ��݂̂��̂𗘗p���Ă��邽�߂ł�
* ���K�\�����e���� (���[�_�[�}�N��)�͂���܂���
* replace-string �� replace-dialog �� Perl �݊��̐��K�\���̗��p�͂ł��܂���
* cl-ppcre �� parse tree �`���ł̎w��͂ł��܂���
* ���j�R�[�h�v���p�e�B�͗��p�ł��܂���
") ("category" "Text Processing" "Libraries") ("md5" . "4a97ae56b7e1c32129a4ace660a88980") ("time" . 3525502199) ("depends") ("changes" . "=== 2011/09/20

* 1.0.1 �����[�X!
  * register-groups-bind, do-register-groups �̃C���f���g�X�^�C����
    multiple-value-bind �̂悤�ɂ���
  * \"xl-\" ��t���Ȃ��Ă� (require \"ppcre\") �Ń��[�h�ł���悤�ɂ���
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "power-usage") ("version" . "1.3.2") ("author" . "MIYAMUKO Katsuyuki") ("file" . "power-usage.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/power-usage.zip") ("description" . "power-usage - �d�͎g�p�󋵂����[�h���C���ɕ\��") ("category" "Utilities") ("md5" . "f1bc90c9886ee02348c5174c52056cab") ("time" . 3522139484) ("depends" "xml-http-request" "json") ("changes" . "=== 2011/08/12

* 1.3.2 �����[�X!
  - �V�K�@�\
    - *power-usage-graph-colors* �ɕ����F�Ɣw�i�F��ʁX�Ɏw��ł���悤�ɂ��� (#13)

        (setf *power-usage-graph-colors*
          '((:foreground 2  :background 7 :usage 89)  ; 89% �ȉ��̐F
            (:foreground 3  :background 7 :usage 94)  ; 90% �`  94% �̐F
            (:foreground 5  :background 7 :usage 96)  ; 95% �`  96% �̐F
            (:foreground 1  :background 7 :usage 100) ; 97% �ȏ�̐F
            (:foreground 15 :background 7 :free t)    ; �d�͖��g�p�̈�̐F
            ))

  - �o�O�C��
    - �O���t�̎����X�V��L���ɂ���ƃo�b�t�@������������C�� (#8)
    - �o�b�t�@���c�ɕ������Ă���Ƃ��ɂ���ƃO���t�\������ƕςɂȂ�����C�� (#9)
    - ������s���ƍX�V���ŃO���t�̒������ς��ꍇ����������C�� (#10)
    - �~�j�o�b�t�@�ɃJ�[�\���������ԂōX�V����ƃG���[�ɂȂ�����C�� (#11)

=== 2011/08/07

* 1.3.1 �����[�X!
  - �V�K�@�\
    - *power-usage-enable-status-message* �� non-nil ��ݒ肷���
      �O��擾������l���ς���Ă���ꍇ�ɂ̓X�e�[�^�X�o�[��
      �d�͎g�p�󋵂̏ڍ׏���\������悤�ɂ��� (#7)
  - �o�O�C��
    - �O���t�\�����Ă���� Mark ���Z�b�g���ꂽ��Akill-ring �ɃS�~�� yank ���ꂽ��
      ���Ă����̂��C�� (#6)

=== 2011/08/06

* 1.3.0 �����[�X!
  - �V�K�@�\
    - �d�͊e�Ђ̏󋵂��ꗗ�ŃO���t�\���@�\ (#5)

") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "grep-a-lot") ("version" . "1.1.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "grep-a-lot.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/grep-a-lot.zip") ("description" . "grep-a-lot �� grep �o�b�t�@�̖��O�������I�ɕύX���āA
grep �o�b�t�@�𕡐��ۑ��ł���悤�ɂ��܂��B

grep �o�b�t�@�̃o�b�t�@���ɂ͈ȉ��̂悤�Ɍ����L�[���[�h���܂܂�܂��B

  *grep:<foo>*
  *ggrep:<tiger AND bunny>*
") ("category" "Editing" "Utilities") ("md5" . "e2bb7ca126796a828ea292cfa3607f99") ("time" . 3521605470) ("depends") ("changes" . "* 1.1.0 �����[�X!
  - outline-tree2 �Ƃ̐e�a�������߂� (#2)
    - outline-tree2 �ŃO���[�v�������悤�Ƀo�b�t�@����ύX
      - �ύX�O: *grep*<�L�[���[�h>
      - �ύX��: *grep:<�L�[���[�h>*
    - �o�b�t�@���ύX��� outline-tree2 �̃m�[�h�����X�V����悤�ɂ���
  - fggrep �Ō��������񂪎擾�ł��Ă��Ȃ������̂��C��
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "guidgen") ("version" . "1.2.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "guidgen.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/guidgen.zip") ("description" . "guidgen - GUID �𐶐����郉�C�u�����ƃc�[��
http://miyamuko.s56.xrea.com/xyzzy/guidgen/
") ("category" "Libraries" "Development") ("md5" . "9643bbd116fad2d0d7154912d41f2e15") ("time" . 3521605457) ("depends") ("changes" . "* 1.2.0 �����[�X!
  - �V�K�@�\
    - DEFINE_GUID �Ȃǂ� GUID �𐶐�����Ƃ���
      �啶���Ő�������Ƃ��̓R�[�h������ 16 �i�����啶���ɂ���悤�ɂ���
    - �������� GUID �𐶐�����@�\��ǉ�
      - guidgen-toggle-use-downcase
      - guidgen-use-downcase-p

") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "vuvuzela") ("version" . "0.0.1") ("author" . "MIYAMUKO Katsuyuki") ("file" . "vuvuzela.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/vuvuzela.zip") ("description" . "xyzzy ����u�u�[�����u�[�u�u�u�u�u�[") ("category") ("md5" . "7f8ec09732113ed864f01f1fe6988a40") ("time" . 3486613633) ("depends" "sound" "api") ("changes" . "���Ń����[�X") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "site-lisp/ni-before-uninstall/xyzzy_times/vuvuzela.l")) (("name" . "cairo") ("version" . "1.8.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "cairo.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/cairo.zip") ("description" . "xycairo - cairo �𗘗p���� 2D �O���t�B�b�N���C�u����
http://miyamuko.s56.xrea.com/xyzzy/cairo/intro.htm") ("category" "Libraries" "Graphics/Sound" "Development") ("md5" . "6e0a5af8f46eeaddce4fc12c4fb23bf3") ("time" . 3455523475) ("depends") ("changes" . "xl-cairo 1.8.0 �����[�X!

: �V�K�@�\

    * �Y�t���Ă��� cairo �� 1.8.8 �ɍX�V�B
    * cairo 1.8 �Œǉ����ꂽ�֐����`
      * cairo-scaled-font-get-scale-matrix
      * cairo-scaled-font-text-to-glyphs
      * cairo-show-text-glyphs
      * cairo-surface-get-fallback-resolution
      * cairo-surface-has-show-text-glyphs
      * cairo-toy-font-face-create
      * cairo-toy-font-face-get-family
      * cairo-toy-font-face-get-slant
      * cairo-toy-font-face-get-weight
      * �����[�U�t�H���g�̓T�|�[�g���Ă��܂���
    * cairo 1.8 �Œǉ����ꂽ error-status �ɑΉ������O�N���X���`

: ��݊����܂ޕύX�_

    * �Ȃ�

: �o�O�C��

    * ���O�� xycairo ���� xl-cairo �ɂ����B

    * cairo 1.6 �Œǉ����ꂽ error-status �ɑΉ������O�N���X��Y��Ă����̂��C��

: ���̑�

    * �Ȃ�
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "hatena-haiku-mode") ("version" . "0.3.2") ("author" . "MIYAMUKO Katsuyuki") ("file" . "hatena-haiku-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/hatena-haiku-mode.zip") ("description" . "hatena-haiku-mode �� �͂Ăȃn�C�N (http://h.hatena.ne.jp) ��
xyzzy ��ŉ{���E���e���邽�߂̐�p�u���E�U�ł��B

�ȉ��̂��Ƃ��ł��܂��B

  * �ŋ߂̃G���g���̕\��
  * ���[�U�G���g���̕\��
  * �L�[���[�h�G���g���̕\��
  * �L�[���[�h�ꗗ�̕\��
  * �L�[���[�h�̌���
  * �z�b�g�L�[���[�h�̕\��
  * �V�K���e
  * �ԐM
  * �u���E�U�̗����݂����ɖ߂�E�i��
  * �X�V
  * �͂ĂȃX�^�[
  * �z�b�g�L�[���[�h
  * �G���g���̍폜
  * ���e���̃N���C�A���g�̕ύX (�f�t�H���g�� hatena-haiku-mode)

http://miyamuko.s56.xrea.com/xyzzy/hatena-haiku-mode/intro.htm") ("category" "Network") ("md5" . "14d5ad4a88b77ef1aae92399d9b7dab6") ("time" . 3448278733) ("depends" "xml-http-request" "hatena-star" "json") ("changes" . "hatena-haiku-mode 0.3.2 �����[�X!

: �V�K�@�\

    * recent �y�[�W�œ��e�o�b�t�@���J���Ƃ��̓J�[�\�����̃L�[���[�h��
      �f�t�H���g�ŕ\������悤�ɂ���

: ��݊����܂ޕύX�_

    * �Ȃ�

: �o�O�C��

    * keyword �� id:foo �̏ꍇ�A�^�C�g�������Ȃ������̂��C��

    * id:xxx �n�܂�L�[���[�h�i�����ǂ͂Ă� ID �ł͂Ȃ��j�y�[�W��
      ���������\���ł��Ă��Ȃ����������C��

    * from ���Ȃ��ꍇ�� from nil �ƕ\�����Ă��܂������C��

    * 1 �y�[�W�ڂ� 2 �񃍁[�h���Ă����̂��C��

: ���̑�

    * �Ȃ�
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "tiny-segmenter") ("version" . "1.1.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "tiny-segmenter.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/tiny-segmenter.zip") ("description" . "tiny-segmenter �� TinySegmenter (Javascript �����Ŏ������ꂽ�R���p�N�g�ȕ����������\�t�g�E�F�A)
�� xyzzy lisp �ɈڐA�������̂ł��B

http://chasen.org/~taku/software/TinySegmenter

��L URL �ɂ��Έȉ��̂悤�ȓ���������܂��B

  * ���{��̐V���L���ł���Ε����P�ʂ� 95% ���x�̐��x�ŕ������������s����
  * �����������̒P�ʂ� MeCab + ipadic �ƌ݊�
  * �������g���Ă��Ȃ�

http://miyamuko.s56.xrea.com/xyzzy/tiny-segmenter/intro.htm") ("category" "Development" "Libraries" "Text Processing") ("md5" . "223924f2ead0402983933f9ea337e137") ("time" . 3425448698) ("depends") ("changes" . "tiny-segmenter 1.1.0 �����[�X!

: �V�K�@�\

    * (make-segmenter): �����������������s���I�u�W�F�N�g���쐬����
    * (segmenter-segment-all): segmenter �̏����������߂�
    * (segmenter-segment-partial): ditto
    * (segmenter-segment-next): ditto
    * (segment): buffer, stream �ɑΉ�

: ��݊����܂ޕύX�_

    * �Ȃ�

: �o�O�C��

    * �Ȃ�

: ���̑�

    * �Ȃ�
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "json") ("version" . "0.1.2") ("author" . "MIYAMUKO Katsuyuki") ("file" . "json.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/json.zip") ("description" . "json - ���S�ō����� JSON �p�[�T
http://miyamuko.s56.xrea.com/xyzzy/json/intro.htm

json �� xyzzy Lisp �݂̂Ŏ������� JSON �p�[�T�ł��B
json-syck ��荂���ł��O�����C�u�����𗘗p���Ă��Ȃ��̂ň��S�ł��B
") ("category" "Development" "Libraries") ("md5" . "1fa971cd431488f846b08f6805962f36") ("time" . 3424844545) ("depends") ("changes" . "json 0.1.2 �����[�X!

: �V�K�@�\

    * �Ȃ�

: ��݊����܂ޕύX�_

    * �Ȃ�

: �o�O�C��

    * �Ȃ�

: ���̑�

    * ���C�Z���X�t�@�C���𓯍�
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "hatena-star") ("version" . "1.1.1") ("author" . "MIYAMUKO Katsuyuki") ("file" . "hatena-star.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/hatena-star.zip") ("description" . "hatena-star - �͂ĂȃX�^�[ API

�͂ĂȃX�^�[ API �� xyzzy ������s���邽�߂̃��C�u�����ł��B
http://miyamuko.s56.xrea.com/xyzzy/hatena-star/intro.htm
") ("category" "Network" "Libraries") ("md5" . "d0ec8d0c10300873734ec8591475f08a") ("time" . 3424844579) ("depends" "xml-http-request" "json") ("changes" . "hatena-star 1.1.1 �����[�X!

: �V�K�@�\

    * �Ȃ�

: ��݊����܂ޕύX�_

    * �Ȃ�

: �o�O�C��

    * �Ȃ�

: ���̑�

    * ���C�Z���X�t�@�C���𓯍�
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "cygwin-mount") ("version" . "1.1.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "cygwin-mount.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/cygwin-mount.zip") ("description" . "cygwin-mount - Cygwin �̃p�X���w�肵�ăt�@�C�����J��
http://miyamuko.s56.xrea.com/xyzzy/cygwin-mount/intro.htm") ("category" "Utilities" "File Systems") ("md5" . "f94a47130167ea4edd58ef4d9da6c48f") ("time" . 3424845911) ("depends") ("changes" . "cygwin-mount 1.1.0 �����[�X!

: �V�K�@�\

    * (cygmount-point-info): path ������ mount �����擾����p�X���w��ł���悤�ɂ���

: ��݊����܂ޕύX�_

    * �Ȃ�

: �o�O�C��

    * �Ȃ�

: ���̑�

    * ���C�Z���X�t�@�C���𓯍�
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "word-tools") ("version" . "1.0.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "word-tools.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/word-tools.zip") ("description" . "word-tools - Microsoft Word �̋@�\�� xyzzy ���痘�p����
http://miyamuko.s56.xrea.com/xyzzy/word-tools/intro.htm
") ("category" "Utilities") ("md5" . "98c7efc5b4b94b7119ab24fe7b33b61e") ("time" . 3424845780) ("depends") ("changes" . "word-tools 1.0.0 �����[�X!

: �V�K�@�\

    * �Ȃ�

: ��݊����܂ޕύX�_

    * ���j���[�̃A�N�Z�X�L�[�� W ���� D �ɂ����B

: �o�O�C��

    * Word ���C���X�g�[������Ă��Ȃ��ꍇ�̃G���[���b�Z�[�W��
      ������₷�������B

: ���̑�

    * ���C�Z���X���C�� BSD ���� MIT/X �ɕύX
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "json-syck") ("version" . "obsolete") ("author" . "MIYAMUKO Katsuyuki") ("file" . "json-syck.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/json-syck.zip") ("description" . "json-syck - syck �𗘗p�����댯�Œx�� JSON �p�[�T
http://miyamuko.s56.xrea.com/xyzzy/json-syck/intro.htm

json-syck �� obsolete �ȃp�b�P�[�W�ł��B����� json ���g���Ă��������B") ("category" "Development" "Libraries") ("md5" . "0f2fe063aacfa602c14e62cd521a2578") ("time" . 3424844529) ("depends" "yaml-syck") ("changes" . "json-syck 0.1.1 �����[�X!

: �V�K�@�\

    * �Ȃ�

: ��݊����܂ޕύX�_

    * �Ȃ�

: �o�O�C��

    * �Ȃ�

: ���̑�

    * ���C�Z���X�t�@�C���𓯍�
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xtal-mode") ("version" . "0.0.5") ("author" . "MIYAMUKO Katsuyuki") ("file" . "xtal-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xtal-mode.zip") ("description" . "xtal-mode �� Xtal �����ҏW���邽�߂̃��W���[���[�h�ł��B
http://miyamuko.s56.xrea.com/xyzzy/xtal-mode/intro.htm") ("category" "Editing" "Development") ("md5" . "572de4ee38d8a887922d054de8673c78") ("time" . 3424844237) ("depends") ("changes" . "xtal-mode 0.0.5 �����[�X!

: �V�K�@�\

    * �Ȃ�

: ��݊����܂ޕύX�_

    * �Ȃ�

: �o�O�C��

    * �Ȃ�

: ���̑�

    * ���C�Z���X�t�@�C���𓯍�
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "yaml-syck") ("version" . "0.1.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "yaml-syck.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/yaml-syck.zip") ("description" . "yaml-syck - syck ���g������������������ YAML 1.0 �p�[�T
http://miyamuko.s56.xrea.com/xyzzy/yaml-syck/intro.htm") ("category" "Libraries" "Development") ("md5" . "776d5fffc534767c0b365f12d609ac87") ("time" . 3411031177) ("depends") ("changes" . "yaml-syck 0.1.0 �����[�X!

: �V�K�@�\

    * �Ȃ�

: ��݊����܂ޕύX�_

    * �Ȃ�

: �o�O�C��

    * �N���b�V�����ɂ�����������B
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "popup-dododo") ("version" . "0.0.1") ("author" . "MIYAMUKO Katsuyuki") ("file" . "popup-dododo.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/popup-dododo.zip") ("description" . "�W���W���� ���ʉ�(?) ��\������
http://miyamuko.s56.xrea.com/xyzzy/popup-dododo/intro.htm") ("category" "Graphics/Sound") ("md5" . "5dcafb9b34d7f27b361f86ce51a275de") ("time" . 3389264080) ("depends" "api" "cairo" "layered-window") ("changes" . "���������[�X") ("notice" . " �f�X�N�g�b�v �h�h�h �ɕt���� DesktopDoDoDo �t�H���g���C���X�g�[�����Ă��������B
http://massacre.s59.xrea.com/game/dtddd/download.htm") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "layered-window") ("version" . "1.0.1") ("author" . "MIYAMUKO Katsuyuki") ("file" . "layered-window.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/layered-window.zip") ("description" . "�E�B���h�E�𔼓����ɂ���B") ("category" "Libraries" "Graphics/Sound") ("md5" . "7e62a74c5d2be9c0238afbfc769f8e17") ("time" . 3389778578) ("depends" "api") ("changes" . "layered-window 1.0.1 �����[�X!

: �V�K�@�\

    * �Ȃ�

: ��݊����܂ޕύX�_

    * layered-window-version �� layered-window.api �p�b�P�[�W�Ɉړ����܂����B

    * �p�b�P�[�W���̕ύX

    * �t�@�C���\����ύX

: �o�O�C��

    * �V���{�������Փ˂���\�����Ȃ������B
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "drive-info") ("version" . "1.1.0") ("author" . "MIYAMUKO Katsuyuki") ("file" . "drive-info.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/drive-info.zip") ("description" . "�_���h���C�u�̏����擾���郉�C�u����
http://miyamuko.s56.xrea.com/xyzzy/drive-info/") ("category" "Libraries" "Development") ("md5" . "3d68ac7aaf1be69a0180ab5984b8544c") ("time" . 3389778569) ("depends") ("changes" . "drive-info 1.1.0 �����[�X!

: �V�K�@�\

    * �ȉ��̊֐���ǉ��B
      * drive-info.api:drive-info-version
      * drive-info.api:drive-info-api-version

: ��݊����܂ޕύX�_

    * *drive-info-version* �� export ����̂���߂܂����B

    * �p�b�P�[�W���̕ύX

      * drive-info �� drive-info.api
      * drive-info-ffi �� drive-info.ffi

    * �t�@�C���\����ύX

: �o�O�C��

    * drive-info �� require �������Ƃ� api �� require �����
      �G���[���o�Ă����̂��C���B

: ���̑�

    * editor �p�b�P�[�W�Ɉˑ����Ȃ��悤�ɂ����B
") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "rimo.tv.xyzzy") ("version" . "0.1.1") ("author" . "MIYAMUKO Katsuyuki") ("file" . "rimo.tv.xyzzy.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/rimo.tv.xyzzy.zip") ("description" . "Rimo (http://rimo.tv) �� xyzzy ��ɕ\������
http://miyamuko.s56.xrea.com/xyzzy/rimo-tv-xyzzy/") ("category" "Utilities") ("md5" . "424b077101b29cf887c20c88b0e9afac") ("time" . 3380738124) ("depends") ("changes" . "����") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "livedoor-reader-notifier") ("version" . "0.2") ("author" . "miyamuko") ("file" . "livedoor-reader-notifier.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/livedoor-reader-notifier.zip") ("description" . "xyzzy �̃��j���[�� livedoor Reader �̖��ǐ���\�����܂��B
http://miyamuko.s56.xrea.com/xyzzy/livedoor-reader-notifier.html") ("category" "Utilities") ("md5" . "7325ce66365d417960050fcae4a28800") ("time" . 3359289454) ("depends" "xml-http-request") ("changes" . "* ed::livedoor-reader-notifier-set-interval ��ǉ��B

* xyzzy �N������ *livedoor-reader-notifier-update-interval* ��
  �ύX�����ꍇ�ł��ύX�����f�����悤�ɂ����B

* �Ō�ɍX�V�������Ԃ� If-Modified-Since �ő��M����悤�ɂ����B
  ���Ԃ�Ӗ��͖����B

* ���j���[�̕������ typo �C�� ... orz
  livedoore => livedoor
http://d.hatena.ne.jp/miyamuko/20060614") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xdoc2txt") ("version" . "0.8") ("author" . "miyamuko") ("file" . "xdoc2txt-0.8.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xdoc2txt-0.8.zip") ("description" . "xdoc2txt �𗘗p���� Word, Excel, PDF �Ȃǂ� xyzzy �ŊJ���B
http://miyamuko.s56.xrea.com/xyzzy/xdoc2txt.html") ("category" "Utilities") ("md5" . "48198c9d378dbbb11d781e9bb3c0edc6") ("time" . 3351176130) ("depends" "encap") ("changes" . "- xdoc2txt ���s���ɍ쐬����ꎞ�t�@�C�����폜����悤�ɂ����B
  (Thanks xyzzy wiki / patch11 �� OMA ����)
- *xdoc2txt-hook* �� view-mode �ɂ����ꍇ�ȂǁAread-only �ŃG���[�ɂȂ�����C���B
- *grep* �o�b�t�@�̏ꍇ�ł��A*xdoc2txt-hook* �͎��s����悤�ɂ����B
http://d.hatena.ne.jp/miyamuko/20060312") ("notice" . "encap �̍ŐV�ł��C���X�g�[�����Ă��������B") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "sound") ("version" . "0.1.1") ("author" . "miyamuko") ("file" . "sound.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/sound.zip") ("description" . "wav �t�@�C�����Đ����郉�C�u����") ("category" "Libraries" "Graphics/Sound") ("md5" . "5df090d0d94cb8836b5830743678b3af") ("time" . 3343142905) ("depends" "api") ("changes" . "���ō쐬") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "natural-compare") ("version" . "0.1") ("author" . "miyamuko") ("file" . "natural-compare.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/natural-compare.zip") ("description" . "���R���\�[�g���C�u����") ("category" "Libraries" "Development") ("md5" . "cfa6cd9c5021c306da82195f2f3cbb31") ("time" . 3329929528) ("depends") ("changes" . "����") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "java-scrapbook") ("version" . "0.3") ("author" . "miyamuko") ("file" . "java-scrapbook.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/java-scrapbook.zip") ("description" . "Java �̃R�[�h�Ђ����s����B") ("category" "Development") ("md5" . "c52a75f0272e624d746b86dac1dd215c") ("time" . 3304083785) ("depends") ("changes" . "* classpath ���w�肵�Ă��Ȃ������ꍇ���s�ł��Ȃ��o�O���C��
* cilpboard �� java �R�[�h�����s�ł���悤�ɂ����B") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "rabbit-mode") ("version" . "0.3") ("author" . "miyamuko") ("file" . "rabbit-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/rabbit-mode.zip") ("description" . "�v���[���c�[�� rabbit �̃t�����g�G���h") ("category" "Documentation" "Utilities") ("md5" . "1e34a70d54c8105ded4864bf47314284") ("time" . 3302763016) ("depends") ("changes" . "�v���r���[�@�\�̋���
�X���C�h�P�ʂł̕ҏW") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "xyzzytail") ("version" . "0.1") ("author" . "miyamuko") ("file" . "xyzzytail.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xyzzytail.zip") ("description" . "�R�}���h���C������ tail-f ����B") ("category" "Utilities") ("md5" . "18ea1e53e8b81bcfb5582911dffa8210") ("time" . 3301058739) ("depends") ("changes" . "���������[�X") ("notice" . "") ("load-after-install" . "site-lisp/xyzzytail/install.l") ("load-before-uninstall" . "")) (("name" . "xyzzydiff") ("version" . "0.1") ("author" . "miyamuko") ("file" . "xyzzydiff.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/xyzzydiff.zip") ("description" . "�R�}���h���C������ diff ����B") ("category" "Development") ("md5" . "d764dbbac7381fd43321e23d7104cfc0") ("time" . 3301058729) ("depends") ("changes" . "���������[�X") ("notice" . "") ("load-after-install" . "site-lisp/xyzzydiff/install.l") ("load-before-uninstall" . "")) (("name" . "windzoom") ("version" . "0.1") ("author" . "miyamuko") ("file" . "windzoom.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/windzoom.zip") ("description" . "Window �̕������A�j���[�V��������B") ("category" "Graphics/Sound") ("md5" . "959f6d03ac75500410df117b401d0bc7") ("time" . 3301057738) ("depends") ("changes" . "�d�؂�Ȃ��������[�X") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "properties-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "properties-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/properties-mode.zip") ("description" . "Java �� properties �t�@�C����ǂݏ�������B") ("category" "Development") ("md5" . "65d21a67d5299d956e71c25e0e0c9852") ("time" . 3301057729) ("depends") ("changes" . "�d�؂�Ȃ��������[�X") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "nsis-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "nsis-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/nsis-mode.zip") ("description" . "NSIS �X�N���v�g��ǂݏ�������B") ("category" "Development") ("md5" . "2cbf8c8cc44a5ea63fb05935060489b3") ("time" . 3301057724) ("depends") ("changes" . "�d�؂�Ȃ��������[�X") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "mof-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "mof-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/mof-mode.zip") ("description" . "MOF �t�@�C����ǂݏ�������B") ("category" "Development") ("md5" . "8d3ab910d25da882127531ca441a6769") ("time" . 3301057720) ("depends") ("changes" . "�d�؂�Ȃ��������[�X") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "luna") ("version" . "0.1") ("author" . "miyamuko") ("file" . "luna.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/luna.zip") ("description" . "Windows XP �X�^�C���� xyzzy ��\������B") ("category" "Graphics/Sound") ("md5" . "b3f171cddc449bb46c7e48e7ae3540e8") ("time" . 3301057714) ("depends") ("changes" . "�d�؂�Ȃ��������[�X") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "is-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "is-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/is-mode.zip") ("description" . "InstallScript ��ǂݏ�������B") ("category" "Development") ("md5" . "e6b9dbc1f022eeede2c33448c0b26e03") ("time" . 3301057703) ("depends") ("changes" . "�d�؂�Ȃ��������[�X") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "ci-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "ci-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/ci-mode.zip") ("description" . "����(*߁[�)�����ǂݏ�������B") ("category" "Development") ("md5" . "8aa2143b3212385613c6cc73b68932bf") ("time" . 3301057699) ("depends") ("changes" . "�d�؂�Ȃ��������[�X") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "bnf-mode") ("version" . "0.1") ("author" . "miyamuko") ("file" . "bnf-mode.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/bnf-mode.zip") ("description" . "BNF �t�@�C����ǂݏ�������B") ("category" "Development") ("md5" . "419fa57880d47d50a0274691a1a0cd51") ("time" . 3301057694) ("depends") ("changes" . "�d�؂�Ȃ��������[�X") ("notice" . "") ("load-after-install" . "") ("load-before-uninstall" . "")) (("name" . "banner") ("version" . "0.1") ("author" . "miyamuko") ("file" . "banner.zip") ("src" . "http://miyamuko.s56.xrea.com/xyzzy/archives/banner.zip") ("description" . "unix �� banner �R�}���h�݂����Ȃ��́B") ("category" "Text Processing") ("md5" . "aeb1c107b48bd23ad6d71bdf64005bd0") ("time" . 3301057690) ("depends") ("changes" . "�d�؂�Ȃ��������[�X") ("notice" . "bdf �t�H���g���K�v�ł�") ("load-after-install" . "") ("load-before-uninstall" . "")))