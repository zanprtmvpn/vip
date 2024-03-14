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
BZh91AY&SY��� P��p1 ���?�ݎ����`z����iAF�B� "��#�C���@��   a4dhhd0���4 b2d�M#C!�� �� ��H����z&OM=Q�h z� A�z��F M ��@    4 $����$�D�<$�'��M(�C��C�S��:��������槾S�_̽�c^����K_Z
��CJ�IE2<�hᘮ:F�ɪx�C��dG�PI՜�0/2!%B_����LӬ#���ؤ�����
H!�k�(�Z �W������	�<�÷-���	kk���/�� {�j妾�ͺ"�ɦ6�-8bG}{�r5K%髤f(V���1����t���շ���o>�vV��N�52=���^cfE����L(���C���PR�E$�rE3���Ae]������7B�;���a@2��줽N��qKo���H���n�[Bt�e�H�y["��LHG�np��MFJ�l�A���B�Z2������t��/V����B,�on/���&WGQ���8mPȠL����`�cm�PG��<bk���(�ҹ .��R�����m�M-BP`����#�M�ɂ4Ԏ���&�p�:��a����	1�a� ��v󬄻P���%�0:�jM�U�m��#��S�ĠX��v�b��ר-�	a�a� �Q����J�C�ш�)kn�B
�}ɰ+�T���h��M⡈ $�T(�D�wQ�w��o9�?��C�i��O�Y5��kH&�Q"!"�#N�?��(���mkN|t�sOl�=���%g�sF]�a$P�p���?[{ ��)2�0�u���<��>�L���D��(a3��Q7O�e���(̄k�����bJO�P8$�_�f���V4S��,��*(vC�복b��A���n�\F7.B���`�A�_~ߣ�QV��&ڦA��X���@�xZ���H���D�{��cj7'R?DS����2�A[^�q��PIQ��D�Phl�\$��K[�a1�V��$bX�YA+8�\$#ZBE�W����jA�#Y�0��}�55c��������6�Z7_q^��y�Eӥ 1S{YbF�ZG�x"#1�$"��@HiR.J����za��Xb�,��(3$5�xV�4� ����0��-��	 | $A ݘٕxQ8cER� +y�q#�<6��H�mO�$5`���P,�����"b����b��R4[z���È�b8!�!f~/�:��u��!#_��5�"�v�9o�B���:u��A�̐�r�����j�s� $�7�$n0�1�	�����:��/Rj�H��3���]]9x��p������VT]�A	%����V=�݈n��-����pǺ��Q�wu�L	�aXO�P+IrxHEI�$t��H9�@$�ȐC��VԈв���bi��{/��H��J3$��KD0�ϘTb�m���-@4	/��$�1*!�gp��R�l.�Q�6�e ���'�I�����+t���.�/ِ #aa��ۣ �6J��ЉN@BK��ߐ�B\�͘�w��!�=|��è����1�ވɜa*�*1�8JO�K�Y����޵�A� G���A�r���[�.9��Rp�fw�ζ��W�j߬rD�4 �'!�6i9ɰ�۫�#i���j+�sG�V��A�djխ�Cr@������C�����W2��W���qN=Do7 �5
��:�s�.۩` �K���Q"z��
\��)���=��CF�#�^�{�������w$S�	��n�