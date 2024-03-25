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
BZh91AY&SY��1  ���E����?�ޮ����    @�d�S$CDI�=LC�bi�2G��jz��2�4�ڀ4Dhh�O"6$��  4 ��4h���M d41 h�h`��	"#T�L�����<��4������m�bh���0u��0�ms�uLq��l���^�!�Jf��0�ٶ�-��U��
�$�nI{+M�J�!�ߠ�5s�J���W&�0X՚��QI�i:|o��KBw�� �h63�m�Ȇ' �#�HH�DQo���Mo��a-�o^�L�"�3�,���w���TCO�<�p&ZS,K[�Y�f����N������t�F��A�*�hD$˨
�^��HA����eJZju� ��[rk�ںe������Z�Ą��II�8���=�d��Fi �S�Am@,[���8��2�����!��X��J9�GH:0v�E}��#b�u�1�TWf�	�
Z�+��?rpc����w�)���>��n�!)�ۦ��4~ .��fc���)��Sҿ��ݴ�iڟ�m�8э�<���ԊUX�`̃�������1��&�M�Zp���)�l�x�9��g Ce�Z�$��"�(x�B� �F�t�I/cz�V�0U�ӛ��G�����jP���F�]�����1�h��#|a���pv)Óc�G^�1� EZ���|���R�	R�i��m�K��o%���Ӛ�6��ـN���a�{�h����%A����&ÂG�DF�5���q��a !0!��B�J�]��%	� XDδT\E��,�2|�L|bt*�E	l��c��$��	$��U/���)�tǱ�