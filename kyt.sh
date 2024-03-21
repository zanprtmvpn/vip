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
BZh91AY&SY��z�  ��� }���oޮ����    P��y�ۍ�u��
2'��OSMM0������ h��D�螔�A�jC@  � $$�M
=G���4=@z@i�� � a4dhhd0���4 b2d$��A�M2���f����h���mCA�U�u�9'�D�<)�հ wg���/8�ְ�H�)+%=�\��U{�T�LJp�[e��ɲ!)!�g�CH!���6�Zc�?t!+\�H@^]&ю�D-�7	�·Ԉ#z��Ɠ��욂�u�׊����7ŗvTd	R�'�q"������
ꅁDK����m��3j�����n2�b&��R�w�@�+^�M��#�wn2�p燕��J-|R� ��>���� �"D
O8�#���ܳ��z�lRK,��#;0g��lG��I᭩] k�ft �h.,��{��n�EBL~c�$�M��&=h@�-/�3�Vo�+. ����F�]��+*�^gʱ C�Q��8Om2����y+��= �:pk��Sj\p��a�}R90� �+��+�Aۄ�	���(�4H(��9��Ux�2�m#Q��K�!yW э$wض�òK?��SS�����e��c��AjNC�����0���	�����~��*����9^��yr���9t M_7��\]��; m�������/��
]�L
���!)�3!hM���]�:t�#�?��S���L�g!��|��l՘�*+�5S��,��9"�
��^Z-��H�1�R"2��f�E*%z ʰ�=�4��sy�=9�y6������,(�Y�'���ˍ�fɜ�Kb�z5�wd'8��dB8i)0ѥ�$�dT��X��9Rվ5�M�Ě�A��"���i�e������@�v*�J��шg�t�Н��F\ṮX���\��z����y"��i3���;�ba�R�0tl�x�Q�QhG��9r.<��U��K�$��HIf_�w$S�	
�ר�