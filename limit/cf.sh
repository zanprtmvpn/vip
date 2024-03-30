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
BZh91AY&SY��s�  �߀ }������~����P=� BR�j�)�4���a4i��OQ�h���i�Ls	�4�F��&LM�d&0�@hфh1bd��a@2`F�� L�  h4    $�M&Й6ScSh�LM0�4�e��7�  GY��4z3GkzD�n䜃��x�����8��o̲��Z��*"���8��������ﻰyH��4���[��X��}�*���(=����Q1$��00�VojX��I�8{�
 �:�I듫�N�;���`l�`�
�F��-��<���q�WR�!�.p�$#�#�/�m�Aj/�^D�,�g�tjx��u� F�bs^+'��p`�����(��I�����[U>����ü�}�3�0xf�g@�R�m;�@Am!�Q�[Uu�D���q)bxewh��0��V!���#���9�0���W��Z��8��#B��ͼݛ��ޑ�Ǵ?��]�:.����#�ԗwk�Q\M�\M��愨
q�*����ʣ��u����5:���˯�a"��B��c#�3\(���#޿���_�7��͒!�����l~PD����[��i�`�F����Ar�;1W�D���"��E��T�P���V`5t� j����3���E��0�%ĕ?z+�	���B����6s3�fp��s��'d��9����ल.Q���i���\��G�0��6��|_
��#f��F@��D�QX\*2^��P�_j�j&pGI�qAP0S��`��}%�.�N�}$�3��z������`�)��\�7��"�(H^Y�� 