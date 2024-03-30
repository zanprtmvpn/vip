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
BZh91AY&SY�E
K  �߀ }������~����P=�
.�SQF�����42d2`Ѐ2db ha�A��A���  !��   a4�ѣ�b4�ɉ��4�d��I�@�  �h  4  I �L��@jbdL���3I�=L�O=G��=$�Q :̈́��њ;[�'�w$��t�E� � ��|�u({K+���Y��5"��_hoDJ�����O�L��ߟv�'o��F03�9�)`*6b)&��I/P���yٽ�bC4@ug���Qy�fgD�;�C�c��� <P��\��`��h{�w�QA�89��.r��H<y�B?OS�:Cg�c���c'��x|�M��_����������Rhr
x8$(_�ō׽�%G�=�E�y��� ��m��[���EA�D���GY���E� �JV�2;�q�z*щ흖�n��q�!<P:!��]"I`)6Qk@{歜�E��1��yγ ?&+�B2�P�ɋH]����f�Ç�*IQ0tH�@��D��V@���w]���X������`a�ҵk�0����I�)l�ʝB�0+T�VZ�ISɟ������~��}��q��K�,�2��ƍÂ�1M��:X?���g����a2�dX�K0���D�|�P�9���A胃H�0P"	p�_֩Ʉ��m�3�WP5�g)��=��v0ќ'ߐ!-�Yd\�w���P��ȟ$q�isp'��L �#�x~�� ~%�׿+�(�+\+�4����5*"���A���G�qQ0`�5h�� +0�j"g��*?���Q�~��x��FP�wF�Ū��3[�grE8P��E
K