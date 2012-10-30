;;;; -*- mode: lisp -*-

("name" . "�J�t�F�C������")
("author" . "bowbow99 <bowbow99@gmail.com>")
("url" . "http://d.hatena.ne.jp/bowbow99/" )
("description" . "�Q�[����1��1����")

("packages"

;; * ansify
(("name" . "ansify")
 ("version" . "0.03.03")
 ("file" . "ansify-0.03.03.zip")
 ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/ansify-0.03.03.zip")
 ("description" . "ANSI Common Lisp �ɂ����� xyzzy �ɂȂ����̋l�ߍ��킹")
 ("md5" . "46a1703d811a7ccec1bdd1b8f884ebab")
 ("time" . 3542021675)
 ("category" "Lisp" "Libraries")
 ("changes" . "2012-03-29  Ver. 0.03.03
========================
- ���t�@�����X�� typo ��Â��L�q���������̂��C��; thx to @youz
- ���t�@�����X���Ԉ���� SJIS �ɂȂ��Ă��̂��C��; thx to @youz

2012-02-16  Ver. 0.03.02
========================
- ���t�@�����X�𐶐��ł��Ȃ��̂��o�����̂� xy-reference ���猩���鏊��
  �����z��; thx to @miyamuko

2012-01-09  Ver. 0.03.01
========================
- cmu_loop �g���̂���߂�
- �p�b�P�[�W \"compiler\" �̃p�b�P�[�W��`��������
  compile.l ���ۂ��Ɠǂݍ��܂��� `compiler::optimize-form` ���g����悤��
- �o�O�C���Ȃ�
  - ansify ���_���v�C���[�W�Ɋ܂߂�� `optimize-type-check` �𗘗p�����}�N��
    �i`typecase` �Ȃǁj�����Ă�; thx to @miyamuko
  - `ansify:defun` �̃C���f���g��񂪖�������
  - `ansify:symbol-macrolet` �� `multiple-value-setq` �̑��l���� symbol macro
    ��u���ƓW�J����ĂȂ�����; thx to @miyamuko

2011-11-04  Ver. 0.03.00
========================
- �ꕔ�̌^�w��q���O���[�o���ɏC��
  - `eql` -- �s�v�� deftype �ɂ���`���폜�i���͑O�̃o�[�W�����ł���Ă��j
  - `real`, `cons` -- ���X�g�ł̎w��ɂł��Ȃ������̂��C��
  ���̏C���� lisp �p�b�P�[�W�̕��𒼐ڏC�����Ă�̂ŃO���[�o���ɉe�����邯��
  �����������ꂽ�v���O�����ł͖��͋N���Ȃ��͂��B
- setf function �T�|�[�g
  `(setf READER)` �Ƃ����`���̊֐������g����悤�ɂ����B
  - `defun`
  - `fdefinition`
  - `fboundp`
  - `fmakunbound`
- �ׁX�����I�y���[�^��ǉ�
  - `sleep`

2011-10-16  Ver. 0.02.00
========================
- �p�b�P�[�W����𒲐�
  ANSI �W���̃V���{���� \"ansify\" ���� export ���āA����ȊO�� xyzzy/ansify
  ���L�̋@�\�Ȃǂ� \"ansify.ext\" ���� export ����悤��
  ������ export ����悤�ɂ����̂� `ansify:etypecase` �Ƃ�������悤�ɂȂ���
- �ׁX�����I�y���[�^��ǉ�
  - `type-of`�istructure �ɑ΂��� `lisp:structure` �ł͂Ȃ��\���̖���Ԃ��j
  - `constantly`
  - `the`
  - `nth-value`
  - `upgraded-complex-part-type`
  - �P�ɖ��O���ς��������
    - `special-operator-p`
    - `get-setf-expansion`
    - `define-setf-expander`
- �o�O�C���i��� typespec ����j

2011-10-05  Ver. 0.01.01
========================
- �o�[�W�����ϐ� `ansify::+version+` ��ǉ�
- �o�O2�C���ithx to @miyamuko�j

2011-09-30  Ver. 0.01.00
========================
- �������[�X
- �o���o���ɍ���Ă� Common Lisp �Ȃ��̂��W�߂�
  - [symbol-macrolet](https://github.com/bowbow99/xyzzy.symbol-macrolet)
  - [condition-restart](https://github.com/bowbow99/xyzzy.condition-restart)
  - [destructuring-bind](https://github.com/bowbow99/xyzzy.destructuring-bind)
  - [typespec+](https://github.com/bowbow99/xyzzy.typespec-plus)
  - [typecase](https://github.com/bowbow99/xyzzy.typecase)
- case, ecase, ccase ������
- print-unreadable-object ������
"))

;; * setf-values
(("name" . "setf-values")
 ("version" . "0.01.02")
 ("file" . "setf-values-0.01.02.zip")
 ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/setf-values-0.01.02.zip")
 ("description" . "setf �ő��l��������悤�ɂ���")
 ("md5" . "14fc77ea9e2c5de718da8fe222bfb607")
 ("time" . 3526381979)
 ("category" "Lisp" "Libraries")
 ("changes" . "\
2011-09-30  bowbow99  <bowbow99@gmail.com>

	* version 0.01.02

2011-09-30  MIYAMUKO Katsuyuki  <miyamuko@gmail.com>

	* (setf (values a b c) (progn (values 1 2 3))) �Ƃ������Ƃ��ɁA
	  �u�ϐ�����`����Ă��܂���: #:G2532�v�Ƃ����G���[�ɂȂ��Ă���
	  �̂��C��

2011-09-30  bowbow99  <bowbow99@gmail.com>

	* (setf 3 8) �Ƃ������Ƃ��ɁA(setq 3 8) �ɓW�J����Ă���G���[��
	  �Ȃ��Ă����̂�W�J���ɃG���[������悤�ɂ����B

2011-04-09  bowbow99  <bowbow99@gmail.com>

	* version 0.01.01

	* `values` �� setf-expander ���F�X�_���������̂��}�V�ɂ����B
	  - subforms �� setf-expansion ���g���悤�ɁB
	  - store-form ���ݒ肵�����l��Ԃ��悤�Ɂi�Ō�̒l�����Ԃ��Ă��j�B

	* `setf-expand-1` �œ���̏ꍇ�ɉ������Ă��̂��폜
	  - 1�ځi`macroexpand-1` ���čċA����j�́A�ǂ��� `get-setf-method`
	    �����������Ă����̂ł���Ȃ��B
	  - 2�ځi`setf-update` �v���p�e�B����������A���̊֐��̌Ăяo����
	    �W�J�j�́A`macrolet` �� shadow �����ꍇ�ɂ��O���[�o���� setf-expander
	    ���g���ēW�J���邱�ƂɂȂ��Ă��܂��̂ō폜�B

2009-07-16  bowbow99  <bowbow99@gmail.com>

	* MIT ���C�Z���X��K�p�����炵���B

2009-07-0?  bowbow99  <bowbow99@gmail.com>

	* �n�߂��炵���B
"))

;;;; jaunte
(("name" . "jaunte")
 ("version" . "0.00.01")
 ("file" . "jaunte-0.00.01.zip")
 ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/jaunte-0.00.01.zip")
 ("description" . "��ʓ��Ƀq���g���U�炩���Ă����փW�����v")
 ("md5" . "39ce5368cd9e2f4603bcda1c28fa7f15")
 ("time" . 3528031205)
 ("depends" "ansify" "ansi-loop")
 ("category" "Utilities")
 ("changes" . "2011-10-20  Ver. 0.00.01
========================
- �܂�Ԃ��\�����Č����ĂȂ����������ŃY���Ă��̂��C��

2011-10-19  Ver. 0.00.00
========================
- ��������Ə������[�X
  - �u���O�L�������Ă��� �o�O���� > �C��> Ver.up �R���{����
"))

;; * symbol-macrolet
(("name" . "symbol-macrolet")
 ("version" . "0.01.06")
 ("file" . "symbol-macrolet-0.01.06.zip")
 ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/symbol-macrolet-0.01.06.zip")
 ("description" . "�}�N���Ŏ������� Common Lisp �� symbol-macrolet")
 ("md5" . "cccaeb61fbfba8d52f95cfa53d96447c")
 ("time" . 3510204196)
 ("depends" "setf-values")
 ("category" "Lisp" "Libraries")
 ("changes" . "2011-03-27  bowbow99  <bowbow99@gmail.com>
	* version 0.01.06
	- symbol-macrolet ���Ɍ���� multiple-value-bind �� body �̐擪�̎���
	  symbol-macro �Ƃ��ēW�J����ĂȂ������o�O���C��
	- �R�[�h������

2011-01-30  bowbow99  <bowbow99@gmail.com>
	* version 0.01.05
	- symbol-macrolet ���� macrolet �Œ�`�������[�J���}�N�����W�J����Ȃ�
	  �ꍇ���������o�O���C��
	- �I�y���[�^�ɒu���� lambda ������ symbol-macro ���W�J����ĂȂ�����
	  �o�O���C��
	- lambda, labels, flet, macrolet �� lambda-list �i�������j�ŁA�����l��
	  �� symbol-macro ���W�J����ĂȂ������o�O���C��
	- �R�[�h������

2010-05-19  bowbow99  <bowbow99@gmail.com>
	* version 0.01.04
	- ���t�@�����X�� UTF-8 �ɂ���
	- ���t�@�����X��XML�錾��DOCTYPE�錾��t����

2010-05-18  bowbow99  <bowbow99@gmail.com>
	* version 0.01.03
	- reference.xml �`���̃��t�@�����X��t����

2009-08-14  bowbow99  <bowbow99@gmail.com>
	* version 0.01.02
	- #'symbol �� #'(lambda ...) ���l�ɓW�J���悤�Ƃ��Ă��o�O���C��
	- lambda form �� body �̍ŏ��̎���W�J���Ă��Ȃ������o�O���C��

2009-08-10  bowbow99  <bowbow99@gmail.com>
	* version 0.01.01
	- let �� let* �ŃV���{���݂̂������ꍇ�̃o�O���C��

2009-07-17  bowbow99  <bowbow99@gmail.com>
	* version 0.01.00
	- ������B���J�����B
"))

;; * condition-restart
(("name" . "condition-restart")
 ("version" . "0.01.05")
 ("file" . "condition-restart-0.01.05.zip")
 ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/condition-restart-0.01.05.zip")
 ("description" . "Common Lisp �̍ċN���iRestart�j")
 ("md5" . "c5f36b98e3e7f753b90d7c21427512cd")
 ("time" . 3507326046)
 ("category" "Lisp" "Libraries")
 ("changes" . "2011-02-22  Ver. 0.01.05
========================
- ���t�@�����X�� `restart-name` �ɕ��ĂȂ��v�f���������̂��C��

2011-02-22  Ver. 0.01.04
========================
- `check-type` �� [typespec+] ���g���悤�ɂ����B

- `assert` �� `check-type` ��ʃt�@�C�� \"assertions.l\" �Ɉړ��B
  ��L�̕ύX�� `check-type` �� [typespec+] �Ɉˑ�����悤�ɂȂ������ǁA
  \"condition-restart\" ���͈̂ˑ����Ȃ��ł������߂ɁB
  - �����̃}�N�����g���ɂ́i\"condition-restart\" �ł͂Ȃ��j\"assertions\" 
    �� `require` ����K�v������܂��B
  - �ʓr [typespec+] ���C���X�g�[�����Ă����K�v������܂��B

  [typespec+]: http://github.com/bowbow99/xyzzy.typespec-plus

- `ed:read-value` ��ǉ�
  �~�j�o�b�t�@����l�̓��͂��󂯕t����֐��B�ċN���� INTERACTIVE-FUNCTION
  �Ŏg���̂ɗ~���������̂ŁB

- �֐� `abort`: �ċN�� `abort` ��������Ȃ�������G���[ `quit` �𓊂�
  ��悤�ɂ����B
  ���ʓI�ɁA�ċN�� `abort` ������Ύg���֐� `quit` �݂����ɂȂ����B

- �p�b�P�[�W condition-restart ����ȉ��� export ���Ă������B
  - +version+
  - restart-not-found
  - restart-not-fonud-designator
  - restart-not-found-condition

- ���t�@�����X�������������������B

- ���낢��o�O�C���B
  �ڂ����� [ChangeLog] �����|�W�g���� [Commits] ������Q�Ƃ��Ă��������B

  [ChangeLog]: http://github.com/bowbow99/xyzzy.condition-restart/blob/master/ChangeLog
  [Commits]: http://github.com/bowbow99/xyzzy.condition-restart/commits

2010-08-06  Ver. 0.01.03
========================
- assert �̃��b�Z�[�W�������}�V�ɂ����B
- �z�z���ɃS�~���������Ă��̂ō폜�B(thx to @southly)

2010-06-13  Ver. 0.01.02
========================
- ���t�@�����X�� file ���Ԉ���Ă��̂��C�������B

- select-restart-interactively ���ċA�I�ɌĂ΂ꂽ���ɃE�B���h�E�̃T�C�Y
�����������Ȃ��Ă��̂��C����������B

- assert �� PLACES �� nil �̂Ƃ��̃��b�Z�[�W��ύX�����B

2010-06-10  Ver. 0.01.01
========================
- �ċN���I�����J��Ԃ������̉�ʕ����̃o�O�ɑΏ������B

2010-06-10  Ver. 0.01.00
========================
- ������B���J�Ȃ��B
"))

;; typespec+
(("name" . "typespec+")
 ("version" . "0.01.02")
 ("file" . "typespec+-0.01.02.zip")
 ("src" . "http://bowbow99.sakura.ne.jp/xyzzy/typespec+-0.01.02.zip")
 ("description" . "type specifier �i�^�w��q�j��֗���")
 ("md5" . "d2b33b30d157fa1c345738ab2e53a843")
 ("time" . 3507702933)
 ("category" "Lisp" "Libraries")
 ("changes" . "2011-02-26  Ver. 0.01.02
========================
- Fix: �J�����ɖ��O��ς����ϐ��̌Â����O���c���Ă��̂��C���B
- ���t�@�����X�̃t�@�C���ɂ����C�Z���X�\����ǉ��B

2011-02-08  Ver. 0.01.01
========================
- Fix: ���t�@�����X�Ɏ��̎Q�ƂɂȂ��Ă��Ȃ� \"<\" �� \">\" ���������̂��C���B

2011-02-08  Ver. 0.01.00
========================
- �����J�B

"))
)