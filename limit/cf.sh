#!/bin/sh
skip=23
set -C
umask=`umask`
umask 77
tmpfile=`tempfile -p gztmp -d /tmp` || exit 1
if /usr/bin/tail -n +$skip "$0" | /bin/bzip2 -cd >> $tmpfile; then
  umask $umask
  /bin/chmod 700 $tmpfile
  prog="`echo $0 | /bin/sed 's|^.*/||'`"
  if /bin/ln -T $tmpfile "/tmp/$prog" 2>/dev/null; then
    trap '/bin/rm -f $tmpfile "/tmp/$prog"; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile "/tmp/$prog") 2>/dev/null &
    /tmp/"$prog" ${1+"$@"}; res=$?
  else
    trap '/bin/rm -f $tmpfile; exit $res' 0
    (/bin/sleep 5; /bin/rm -f $tmpfile) 2>/dev/null &
    $tmpfile ${1+"$@"}; res=$?
  fi
else
  echo Cannot decompress $0; exit 1
fi; exit $res
BZh91AY&SY��  �߀ }������~����P=� "j4h�  4    s	�4�F��&LM�d&0�@hфh1bd��a@2`F�� L�  h4    $�@M&�M&!���i<��3&Q��=Lz� �l$���ޑ<��' �#��:/A G q��;���9���.����`DV�}1L*~���$A>�����
���"K�k~dpe�Bz�PA�1|�,7�	R^�����f�J���=@�ub�3�,¤�J걓���P�8���0�[�	sn�8�r���x�)TD3����`eL�
(FLW@CO�R ǀ?ΐ�36�2�%����-n`�]٤~	������(��ͮ�gku�T�xT(���|�:�.���l�IK���E�D��y#Yeʪ"���D������ǐ^�U�J��U�r8��q������R�^�ė��w���#��G;~ݼ�$�"wt�߫Q�X^=�^�{�\�_#s��x�<ˋ�0��eJ��킩�����F��W���y�j�+���^"N�¤�_#�2Z(���e��a��If������1nD1����{��I�/0r�K�a��G���31su�",�i�L�H"��-!�.�1J��� �<��=��g���#0�0H"	p%G�ʥa2:�8P+����Q� c���	ہnPph2|	v�%عG�#J����O��b��М��PAs�q�(�m��Ң�p��+<Ho�Ҩ
�-�3�"��H�r�`����@[��("d�LᖒKt�Ncքan�l&[Ԇ�s�h���"�(HutaC 