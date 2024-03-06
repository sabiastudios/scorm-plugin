GDPC                                                                                          X   res://.godot/exported/133200997/export-8b6fc8cd62edb7e5068a5660e6906324-TestScorm.scn   �~      �      <��?�^Ù���}G    ,   res://.godot/global_script_class_cache.cfg  Ѝ      �       #5"J��djO�c+ԩVR    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�j      �      �Yz=������������    X   res://.godot/imported/index.apple-touch-icon.png-750073964787102e2676d8973caca641.ctex                ��tZ�2ҎP�&��    L   res://.godot/imported/index.icon.png-94b5979d8023911487c1bf4073796457.ctex   /      $      ���4d���4�O�U    H   res://.godot/imported/index.png-c88c7c8dad918401bd2b9be0e2933010.ctex    =      -      �%�$����<�׿�+    H   res://.godot/imported/scorm.svg-5ef9df02a692c31f070b46659f194ab4.ctex    	      v      K�U�f|��T��S/?�       res://.godot/uid_cache.bin  @�      �       ?H�`���0�$�>e       res://TestScorm.gd  �x      /      R`U���tV*ڥ��A       res://TestScorm.tscn.remap  `�      f       zU�U?gr�w���       res://addons/scorm/export.gd        g      -���P̐Z�c��       res://addons/scorm/scorm.gd p      �      "�F��~Rix���z��9    $   res://addons/scorm/scorm.svg.import �
      �       ۙ���:�%	c�4�W�        res://addons/scorm/scorm_node.gdp      �      0Z�,�t�p��ð}��       res://icon.svg  ��      �      C��=U���^Qu��U3       res://icon.svg.import   �w      �       �y"��%�?� +���       res://project.binary0�      �      ��R�Z�|�:�{��    0   res://release/index.apple-touch-icon.png.import  .      �       ��NOn�Z*�mC    $   res://release/index.icon.png.import 0<      �       ��9�Q[�:�
�o��        res://release/index.png.import   j      �       Ъ��=�oh3Kr�6�            extends EditorExportPlugin
class_name ScormExport
var _plugin_name = "<plugin_name>"
var final_file:String

func _export_begin(features, debug, path,flags):
	final_file = path


func _export_end():
	var final_path_array = final_file.split('/')
	var export_path = ""
	for i in range(final_path_array.size()-1):
		export_path += final_path_array[i]+"/"
	var files = DirAccess.open(export_path)
	var string = '<manifest xmlns="http://www.imsglobal.org/xsd/imscp_v1p1" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:adlcp="http://www.adlnet.org/xsd/adlcp_v1p3" xmlns:adlseq="http://www.adlnet.org/xsd/adlseq_v1p3" xmlns:adlnav="http://www.adlnet.org/xsd/adlnav_v1p3" xmlns:imsss="http://www.imsglobal.org/xsd/imsss" identifier="godot_scorm" version="3" xsi:schemaLocation="http://www.imsglobal.org/xsd/imscp_v1p1 imscp_v1p1.xsd http://www.adlnet.org/xsd/adlcp_v1p3 adlcp_v1p3.xsd http://www.adlnet.org/xsd/adlseq_v1p3 adlseq_v1p3.xsd http://www.adlnet.org/xsd/adlnav_v1p3 adlnav_v1p3.xsd http://www.imsglobal.org/xsd/imsss imsss_v1p0.xsd">
<metadata>
<schema>ADL SCORM</schema>
<schemaversion>2004 4th Edition</schemaversion>
</metadata>
<organizations default="godot_scorm_test">
<organization identifier="godot_scorm_test" adlseq:objectivesGlobalToSystem="false">
<title>Godot SCORM Example</title>
<item identifier="item_1" identifierref="resource_1">
<title>Godot SCORM Example</title>
</item>
</organization>
</organizations>
<resources>
<resource identifier="resource_1" type="webcontent" adlcp:scormType="sco" href="'+final_path_array[final_path_array.size()-1]+'">'
	for file in files.get_files():
		string += '<file href="'+file+'"/>'
	string += '</resource>
		</resources>
		</manifest>'
	var manifest_file = FileAccess.open( export_path+"imsmanifest.xml", FileAccess.WRITE)
	manifest_file.store_string(string)
	manifest_file.close()
	
func _get_name():
		return _plugin_name
         @tool
extends EditorPlugin

var export_plugin:ScormExport


func _enter_tree():
	# Initialization of the plugin goes here.
	add_custom_type("ScormNode", "Node", preload("scorm_node.gd")
		, preload("scorm.svg"))
	export_plugin = ScormExport.new()
	add_export_plugin(export_plugin)


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("ScormNode")
	remove_export_plugin(export_plugin)
	export_plugin = null

GST2            ����                        >  RIFF6  WEBPVP8L)  /�pI�"�:��Z��(h�F�sv/��m�:����m������;@Dd����4@���=��oiۤ���H$�N��?�)5�z#�HKL�	A�}#�z<B�2x#�@��4��u�N��j���H� �V���
�bx��e����!��ؼ��S�������>&'��� ����v�{��ޠ���p����ro�7�[����e�q�	N����2/҂�|�%��\�k�M�TU+�az���Xإ��]ÏړZ1* p�B
 �G(�            [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dimo7p03v7ou8"
path="res://.godot/imported/scorm.svg-5ef9df02a692c31f070b46659f194ab4.ctex"
metadata={
"vram_texture": false
}
               @tool
extends Node
signal setScormValue(atribute,value)
signal getScormValue(atribute,value)
@export var emmit_return_on_set:bool
var attributes:Dictionary

func _ready():
	setScormValue.connect(_setScormValue)

func _setScormValue(attribute,value):
	JavaScriptBridge.eval("ScormProcessSetValue('"+attribute+"', '"+str(value)+"')");
	var return_val = str(JavaScriptBridge.eval("ScormProcessGetValue('"+attribute+"');"))
	if(emmit_return_on_set):
		getScormValue.emit(attribute,return_val)
	attributes[attribute] = return_val
	return return_val
	
func _getScormValue(attribute):
	var return_val = null
	if(attributes.has(attribute)):
		return_val = attributes[attribute]
	else:
		return_val = str(JavaScriptBridge.eval("ScormProcessGetValue('"+attribute+"');"))
		attributes[attribute] = return_val
	if(!return_val):
		return_val = "null"
	getScormValue.emit(attribute,return_val)
	return return_val
             GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /��,� j�Fj���'|$"���X��qj��mC�$� �O� �\E�$)} `��;�� m9�����������r� \.��-�q
%;���{~��s�(hۆI���� PH+ߌ ���m����f~�]>�\��NAǠn[uNe��2�R�*���]�l�i���	Tr#Ir$��0�`��_��R{]Aɑ$G�$��Ydx��ou��ieȕd[����>F��>�Kf1���)u���͑?�Rv�T5��mO$ٶ��d�N��q���T�yk�&f��L�y$w
�@gw3�����t�t7�	%�m�z$i���O��`(ff�=i�ڌv��2c2Dde(����l[�m۶<�>�a�X�v�/�6��5�����m����@�B�E=������H�t�9��$��:	n|Bcwضm Q=��pk�m$I�$Z����=G�m���������e�g�g�<�L@%�G���� >����VW���3UR$hA*�A���+>�}��y�2ͧWx�\��->=�1 ��@���O��l7�Lo��yX� %��c����Ͽv׭�n����
����)���Z-��<8��9.cE ���������F��v 0� �����F����j���ik؁M�Bk"� �q��z��>�x�q���N�2�Џ��A�& �N����f{�ϙ��u�.ܓUF�Cm�ڰ{^��pƋկ����\ӓ� � �t�Lo!���t��]Gn�S�@"�X��f]��m{R�y
5�:�`_�aиi������  R�DB�	 �Ĩ�� �Q���G���u���^�х|�  ��l{&x�7h�t��|�FP ��E_�,Ra"�5��i�R���  4�ЅS7�;/�I�:�����l���L7�:Ņ�`E d����	"",D�ZAY�I��+�-lɂ  0�<�Q��QW�:�3n`=ֆ�ђS����/�g1�"@.z1V�JI � �h �DY�R[l(E �Q��͑b�E|�̺��X���:���2 $1(�2V��&M��2���X$��Z���>r�-Ei� �����˷�)�@�2i�h�R[h*�$  I�u��~?3�� �tv�u���� ��IC@4KDt1i�$ �1o��|l�����W�<�^�y��(� �(�����cm( T���z��<R�����cy���2VX���:�ڠe  F��KVw�3����̇�y;�k]���� ��_��/G|���{76@�A˂h���.�J �����7߿�koMdRd�I@'щ.B "���͛���a5  ��b�8�S�  V���v�m�/r  j�	� ��EX�(,Y� ��-( @D*�6""  E��Ǆ	h�P �ZPA 0��!@  ��" @D@GD   �<�?�  %]a�2 $Ro���j�b\Wݰ+�a�f\¸Ʋ�y���b"���#w����Φ �5�N:6		I%J[�[��P�(lנ1T�x  @[u�RP�6m���jT��VS,_R+�C]�c���BR���9����a�x1dm��r����fX����jYS]5*�	f��+m���2Ʃ ���.q�@  ���@��K[�̳��1��Wʚ�k�5�!�ܣ:_ΘTQI��Ȁ����FfF�1F��� ~2��Y�P �S���N�K`0F�����l�޼p��KdF�_�uO�.�qr�#��<���% �+ �]�;]]$W�M0T�@� /K�H��|�zZ�m�  %:cx�#U�����V�\
-�Q_@�.,0~�y�� `���g�!tSR�2 ���Ht$h�=��O�q$���r(���R �/���J2bJ��g��� �!)����JT�q�m0~��  �R %���I��)(�@PR�c`�$��k!J/p���̖g����8�I���2Ys���G�e�Q�O���Z�m�d���b�ЂȣVr؂�Q�f:֝5�h�j��9���@�a!�y]tMk����\��fЙ�K-� �7���Ѹ�@�>ڞC�"xBur4jeӷ���Q֭�ن��KH����l��q�ȓ๼�y1&#�Z?�P�ٚ�0��2P���K����l�6U��*Bc8Fc<�(�MI�3,0��=�i���Q��)4k�6gp@U�M���Մ�$ h*]�i�0�%�`�M� ��uNv&��� aI6�t��TK�4��ݙ�������}v�� ��.��"�J3��r�G� ���B����g;��J)4b��L����Оw<�^M��k�Y�(�!!%�ӗŒ��'���|�@$$  �@��y���R�IG	�� Q�����4���	��@��t��Č�馷�CA n1�d9A��2��0P�U�h P��sy:��xT�U��/�	�2"	�0"V��>�#���hԑm�C�K��@ x����$�Fh�F-����A�IF�i�| �ח��iT�B	�xL��d���骋X���]�>�~DW�ܢ骻uk���o|q�~4?;sg�4-V~�^����E�5J�g��ÒG~c��Es�U?�Zu�������ܙE�U]�V��O��Ν%���*�.�������r���.0{��_���3� �9�pe�II�XI���=m��]��;},�$��V5��{;�-w[���V�V������`�o������j]V�5Voe]�d�o��"���<�`���gtg���^��'��+`�9SNs����o�+h���_�����l�'9;P,�^E���h���^zG��A����0������������DŤ�����)��0�x]1�]�����]�Lp�wɽɍ��\�,�EC)�ֺl����c�ه&w������} S!����)ճ������A����>���w��_���zZt�X�A벓��|�Y;-<d�
���O�a�}��:�����Q��A����}�Ɠ��G^~��w��'߿�ך�Q�R?o�Y/�<�yY| ^.��w�uo�����`�:����>���锁WG�O��;�����r��(*��ދ>���ש��D㔌�ݽ�.�VA��w�}�|G���M����}G/��Y��Y;���X�
�%ӧ�ޫM�O���w�yǯ� �|��Ǥ�5u��]�l�/�件�
#�l>���չn�}6;��Ǡ@���=6 �J���;������:xY� B�5��<�#�6���R3�c�/�{Q��\(��]��l�r5/�=s�2��|�}�'���[���`�![T @g���Qv��}���T n��?8  ��F���
�j�����K��y�O�|Z��^r�=o�Ez��.�]� � ��2<��n���W��U������  �u���ux���ڗ��G5�^�'���~�W����?�{��R�Y�B����)߬���{��?����@<�VS�V9�y�v`�.a^!�|�}��V�A�T�ٚ�zt�����l�i�O;x�ɫN^��7�Y�N���?��|��2�o����tUGk_U�V?[�"22��?��<�?��&ć�?l檝z�[�/, ��u�oW?o�`�<*>��z4`N�1��m @5SO����  ��u+���S<z�������e�  K��`k.���g���/�sw<��  V4�ͬ�v/\2���53t�����-e/Pk��R��i/喱�!��  ����� `�$� N�.`~���B�t}9@΄�x P��f ���<x�>��|����}fyd�3  �8�-�7� 0��ј�	١�{��z~z}n>�۳�U�&�<�n�� �UZ�6�mx;�0�[�rD����뽛{��ܮwUz/��Pa�|-;��)�a7Q�M�_)�.�����_T�����}�wG��s���d>��]�x}��g�'����[㓛���5߫�.x� 6��x)7f2�r9��X�ڧ�����o�4^� }�����?�W�𹛮��������Ѻ�7�����{�~�C�>�Fv`��\�7Zs)70����Σ+x���������W&�^F�o|�����񟇟�s|����.)���+�֗�;xc��������������}��q �ۣ��`�\��ե��$`�����������2����/���;�����?��?�������o��ynW`!��̺�������f�O����� =�{��w�+9�m��(�����<Wʃ|,�Rc������໾���c�/o|�W������O��������u���f9��Wo��w?����gߺϾ��i��T�t�y�[ox�H0���7�������5���<8��������(9KR�Y�V��o׿�;u����y��լy1^�I�$5�s::��W��>���|�{UtO��{��.�kb�������������_���� �H�N*��]}�}�G\�JV\/p%�<L�͒Ȩ�ѯ����U��E��D�������<�ֳ4� d㺾�v0NtHXI2 %�u=}�=͠sr��i[����*��p�ܯZ��Uߟ�����E����Koի4�L
�F����Z�6*���tի�4[�r+�<��~�S��I7Z��w��]���S�_�p�.g�&�&�������R�fP��օ3]��,Ӳ�E&����v�<-bR׫�U2
��$�����n�%3Uf~��	�RѤ�k�n�Gn-�"5Tځb1�u32��JT<�Z�7ˬ�
�ā7mq��'#�����><c1,���q'��hQ���TTS�j**k�� �r�4[�{��9�������������+��:.���x���.-j�J���P(Ԣ����ަ���~����j� �N��K_M
Ha )��ZR�,MJ�d]�l�3�`�QծF�HQE�)�Ha BA����_���\���x5��w<ϗ�//6�~���<SJ�R�����%��ҥ-�.�*x�?��	��Rӭ�b�Q��  �s�z�6P����� g��)��F�g(<<0�����?�k~�Z2���զ~/��p]6((�h�E3DD��wEP����a���fݽ]l�W�J���+R�Ia )�d�$"�����L�ޞ]O�\�����g
�B�O@HH�
		*$T@���� �fE������0TYK��j�� *��D�͘-VY��Ȓ�ƒ�,�<28nO�ߓ�/�-M�7  �.�A���`0e0�uͱ��π"����-��
l�}�����)@������r�o~���8\\����# ���&Y�W�`Ύ��P���hW^�\
]������ 5�+���u���z�V�/PdFU��:L �A�ׄ\�u�g2C���h���
���d%����E���W��$��j]O��jm�Λ�R)t��ɧf�$@d�S Ʋ�
��dE#�/k@ mW��(���z>z].!X�dT��/�<�rQ� $VL>i�&m�`�0i ?cM 0�W wPG�d5S*�;S�� ����\� 
 ������ɲd@�3���l� �x(���@��Y�[�l|���CQ*;�l]e�P�� e�ϝ�񁥷��NW�ꛋ�F 8��Ǭ�|y|����/�/�y��S`Re�]>��g�O��QUA'�tit���ѥM�FGu:�<=��@��䳧���s����K 7�]�%!��$[6���r{��VV�lee�Vcj���Ԝ0�n]2��'x��j��L�P�Q�M�:m���<թR3��� Had�|ɣ?��Y�-�g�#h�ڟ��o7��S @$C$C��H�I��Ps�9��Fo>�(����0G����T�BQQh��B+*��Kyj�|��Z�Z��յ7{@�<�/��O����/��b�]�7��+��7���;@�@�`�ɝ�s�'y�F{Ve����x��ǜ���_�����j�6�R�ԆVj�6�R�Rkj��hKmh� ����coao����w'���x�=��{2x�'��{�'����=~���}N�^p�<��M4�Z��Z�E!r `�E��-<�Ix������$8/<��$<_p����>�d �{�7��ˏ��H�:��&o��� ��7�k��e7g�e��k��������7e��n�^��Kޕ���ȫJ���
�`D[�[)-j���h�6�R�����Jm��ڨ5�Rk��6�7o�3G�L������쇻S��7��񷟵o?�︻�m��xO��$�x�=��ޓ�{<�>�d�?��@^"��,��2P�ywlYM��U�Hg�n���=P�L���q���������P���#��6��3e���^����T��@
��֮�9�Y�R���,�ieYc�5f+��Љ
�&s��lM�� t�`�����8M�/4_�@�B5����!�ܤf5���@�Ƴ�6զ>S����-�ƕ�pӶmgT� JHJ��#�e�,��Qjٞ6Fà" %�n�,
Pΐ�aM�4�VD�H�ַ���q��6��[W{�%�@ڨJ��-�Y�6N��:P�Ӛm�>�Ȩ4|���i]z�x���*�����YX���]:Ƴ�ll�1-.2�"�T��1�+ThF
ʒG�l6��7c��2��V��j-�\ê�RF�<��@0 HqIN�D�y�]ߦ�����eL�[�ZjVU���֌���d6��:'_�<b`5�B��
%$��`f���tS��8�\�����Z�tJ��Ͳ�K
�z�Q<(l!!a���y$� ��`R0�`R@
3)��,v�)S�lX˔�f\�͐�e�� �L�!D�괩R(T�{J
).���ac291�����I�7G)�Je�D!��#��<)))AJc���,��?e�� `��h#.n@���/ @E10  ��_� ��Fv�  ���g�H Fm��,B4��6��v ���PI���g  p�i�������T&Y4�3yc  ����e-�p �P�쐕&r��܀)4�|z5��A��
2� ++��JT��ɋ- "��n�:�}����/���!�[J����
(���  VI�C�~���wױ �ņI�y ����  ���^X|z��˻���g�!��Vjи��5��  ��+6��޼@���/X��$1M]�hg
g�  ���z�����r�ެ�A H�T&}Q�h6�R8�Ρ� �`�H���C �4�u]��=9��}h@c1�F�Y f��;��  �5��73  ���\��O��B1@C1h]��$��(���C��  .�2}�Bg��W= �7P�	��u�©�B1 �1ֆJ'"B�� CD#�` �g\ɝ����  p���})������r���@��'��:��<�be �It�)}�EB(�fpp�E�ɛc��g   .�-[��C���Y��^�l �|�4ިW/l�Բ�  D9b""@@+b���[   2���J����s�����)���� ��u��{��>R{�A���]!�ƺkNߥ۫ C�  ��_'?�l�� [� >����g��؊" �&� �з"�ϟ$���u�n���6�A� ��θAiֽ���~���d;т\��V��y����o�v��t�}Yz]���� p�	 lur�̺���V8:�t�9�_����;u�����( �L#@�;\�
'��4l�\ؗ��~z�Y�.������  ��>���}g���;�/��>Ǘ#�!}7w�Śc�HЊT�o�����)�5������Ly���Yn����=���  [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://dreat6u2ilnw1"
path="res://.godot/imported/index.apple-touch-icon.png-750073964787102e2676d8973caca641.ctex"
metadata={
"vram_texture": false
}
              GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�m�m۬�}�p,�젮�N{2n�d��5���$I������ԇ$W�NT���H�ɊȌ�j���k��f�v칢�����n�d'��3���Gu��^�6R�Lw��@m��B���fZ��X�m���n�ضgֶm۶1�Iw=Ou*��۶����O�ii;@T�֏@��‶��r��D�gw�!���Hr.�Al׾!� S�MG��"���	� Z�p )��#L��+6��r�#ART݈R�MW�x�@g�YF�.)�lZ����
t(x�Q��bW#�;��;���]�iK��w����W��SF�;M�Ԡ%E���ntY��YNݖn�8��Q�*EՊ�1
��a����[W�Ӯw4�=!1�5��wZ�:s�6o	4�y��L�!��Aֆ-��x(��2Z����`��1��̶��;Z���Y�n]z�K��� 3���|�:��ݶN��)�;5�-�¸��W�fi�OAǸ�Wngk�f��v{�+�h�n�
4��p�rp�f�kj���ԛ��-$�o�o��o��S�md�d)���5��XJ,�6�M�M�,6�[3��u/K�6���o�B5���'���c%J��mt�YW4�Uk5�Y���իZ'��*L+K	N����ܲH)3�:�B�W�,%$!Y[�j�NKb�T�SiX����S�Q�`Y�j �k�V27���]�*��C%�/�|e�c�Q~�y�N�B��(rwT�iŰϛ�f����SF��R☜�*����SR:�)|��=�ŴzU��h�����'I�<I,%�&Ó��^G���J��R�*���R�uZ4�{��y���ũ�B�k�OF����~*3����z���Z��u�g��%��|�t�h�r˺^��+�ūĒ�L,k���R1d��1��t���F���Q��U�c%��m�[�u(�r��U�ʗ��ס�Zz4��RĴs?U����i8��H'��9���Gu�2���O�p��$h�ә�}%�$*�%���D��
��R6U�7>����$KI��>{-�(KI��Z%�^h)�̃��պ��[Ӄ��Xj��,�o�?�.�J�ͼ��3�ֽ�*L��ߝt���u(9ν��$����s��(l"*v��P�����r�W�G�����~}!���9�Խ�ᣇ�}��V����3��Yjj�z��=�6w�!{�߀���>n#�&��Q��GPf�O;��^[�~�O@ŕw'�0�F=��u���H�]I+�~�ٕW UD�D.D�D턟�ᠹۣW?D}#�&L&r%
"� <�Z������ɶ`����@�'�Ə�4� ���	j�ì7�yS�@�W�@ ��Dz"�4-X���:4g���$�)�B�@ ��`�ܿ� ���e�~ZU�R#�x)�Yvs#�Q��?8)�҉�]i��8>9^[�� � 4�2{�F'&�Y ꉠ|���|�.V�'��QE �F"��!sf^��|�3u@�B�\����j�G�3�� n ��%D���K��SM: ��S���"�+ P�9=+D�%�Y �3� �G�z�D ?"�!�3nEТ��?Q��GD ��4�^��~D 鄐�����	��\.۶^B%�=Bv.��s�)ЙH���U���c������L-�@[�D{��s���Q��B��SJ�����=��FK`������f��#2���f;�,%�L���?�;@=a0��ȝ(�h?� �k��$�ܝj/?�g`� ~ � �����Q��7�h��*?  ����f�Y���y��#���s�h8���������Ү��Y��%ۊ�
��A{����N��T���,��dsY�����Ό�i��7�kZq���8��tq������ݨ��9���]�v�bS^Ό����=λ��9����6n{�m�;����Hm����x���|�@�_���������:;��GFjW܎:����θ=2��e��2{r���ѡ�Ⱥw���C�߾^�l�7�W��秿�ϯ?����Ӧ�K������|uh��|����>>�����o3?���4ɱG7���O����:���ٓ��[�A}~~b�f�ȥ�1�n������x���.�|t\�N�w��4��ZD/�������yq�S����U|��涆=e�æ����\��y����agͮ�Ւ�#f:3ۭ�kV+�%��"��̊ #Yf��@m
F�N0_:!$�`#��ts�wf�z�z�aƛ+��`E�Z�^	�����p��-3ݚ�������&9 {�}�u�&9�9+�g*M�[~{�3;���>^�~n���ŜOL���z[��z󨳝��ԧ�'v����Pg�ň�����~O���9�,�G����ϗ���l�vr��n�ELd�D *�`w��.��"���;�\/y�ظ�Ԡ¹,ǜ�JH�g�ANN��>��n�fu4ܰ�nϛ�aw��ӳ�R��������������s���,�	�D����  Rï����������v�|^.��Yqx�v���`��,#��ٰH��tq�wn�R��#Ef�U���u�V��eZ�0�l}�Ѧz�%;��W��M�K�ۚ{�N{����%������o�������ǻW��/f��r��Rx��j�<������˿K�����wK����9��7\}����_>��Y���C|�{�؛$9jk���ヿ������N��%�HrHIf���ġ��Q�?Se����r���r����ߪ�x]��괘/�;�P	~f���E�l��Zw�n���m�j6]/EТM��r�ڽ�,�Y&9]�����lVM��o���6v8fK���yP��d����{z�ƌ��E�S�[�A,��d���:��;X�5�:hц����1B�>hѬ^5��מ���,��o�,��l@b��ze�� 1�w}���l�D.��Yz�r���T�#O�<��l��i#�S��!GĶ�EO}r�K����A�\�<N�zd!E��
R��z�S����x�ö�\.�2)"E �@3o9u�.y�@��e*H�m����]�h�HB.�#bD�j��V8ߥ��Eh���\�ejL�ku�;����l�>N{;����)�P���ʘ�R(E�����n�P.�5a��R7 �0bo��Y���k�%E��;����ÆB�2]m��ր^�Ȗ�4���1h�O������
(�WX             [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://bgat3k4ue3ye8"
path="res://.godot/imported/index.icon.png-94b5979d8023911487c1bf4073796457.ctex"
metadata={
"vram_texture": false
}
          GST2      X     ����                X       �,  RIFF�,  WEBPVP8L�,  /Õ�mۆq�����1�Ve���G�N^6۶�'�����L �	���������'�G�n$�V����p����̿���H�9��L߃�E۶c��ۘhd�1�Nc��6���I܁���[�(�#�m�9��'�mۦL���f�����~�=��!i�f��&�"�	Y���,�A����z����I�mmN����#%)Ȩ��b��P
��l"��m'���U�,���FQ�S�m�$�pD��жm�m۶m#�0�F�m�6����$I�3���s�������oI�,I�l���Cn����Bm&�*&sӹEP���|[=Ij[�m۝m��m���l۶m��g{gK�jm���$�vۦ�W=n�  q��I$Ij�	�J�x����U��޽�� I�i[up�m۶m۶m۶m۶m�ټ�47�$)Ι�j�E�|�C?����/�����/�����/�����/�����/�����/�����/�����̸k*�u����j_R�.�ΗԳ�K+�%�=�A�V0#��������3��[ނs$�r�H�9xޱ�	T�:T��iiW��V�`������h@`��w�L�"\�����@|�
a2�T� ��8b����~�z��'`	$� KśϾ�OS��	���;$�^�L����α��b�R鷺�EI%��9  �7� ,0 @Nk�p�Uu��R�����Ω��5p7�T�'`/p����N�گ�
�F%V�9;!�9�)�9��D�h�zo���N`/<T�����֡cv��t�EIL���t  �qw�AX�q �a�VKq���JS��ֱ؁�0F�A�
�L��2�ѾK�I%�}\ �	�*�	1���i.'���e.�c�W��^�?�Hg���Tm�%�o�
oO-  x"6�& `��R^���WU��N��" �?���kG�-$#���B��#���ˋ�銀�z֊�˧(J�'��c  ��� vNmŅZX���OV�5X R�B%an	8b!		e���6�j��k0C�k�*-|�Z  ��I� \���v  ��Qi�+PG�F������E%����o&Ӎ��z���k��;	Uq�E>Yt�����D��z��Q����tɖA�kӥ���|���1:�
v�T��u/Z�����t)�e����[K㡯{1<�;[��xK���f�%���L�"�i�����S'��󔀛�D|<�� ��u�={�����L-ob{��be�s�V�]���"m!��*��,:ifc$T����u@8 	!B}� ���u�J�_  ��!B!�-� _�Y ��	��@�����NV]�̀����I��,|����`)0��p+$cAO�e5�sl������j�l0 vB�X��[a��,�r��ς���Z�,| % ȹ���?;9���N�29@%x�.
k�(B��Y��_  `fB{4��V�_?ZQ��@Z�_?�	,��� � ��2�gH8C9��@���;[�L�kY�W�
*B@� 8f=:;]*LQ��D
��T�f=�` T����t���ʕ�￀�p�f�m@��*.>��OU�rk1e�����5{�w��V!���I[����X3�Ip�~�����rE6�nq�ft��b��f_���J�����XY�+��JI�vo9��x3�x�d�R]�l�\�N��˂��d�'jj<����ne������8��$����p'��X�v����K���~ � �q�V������u/�&PQR�m����=��_�EQ�3���#����K���r  ��J	��qe��@5՗�/# l:�N�r0u���>��ׁd��ie2� ���G'& �`5���s����'����[%9���ۓ�Хމ�\15�ƀ�9C#A#8%��=%�Z%y��Bmy�#�$4�)dA�+��S��N}��Y�%�Q�a�W��?��$�3x $��6��pE<Z�Dq��8���p��$H�< �֡�h�cާ���u�  �"Hj$����E%�@z�@w+$�	��cQ��
1�)��������R9T��v�-  xG�1�?����PO�}Eq�i�p�iJ@Q�=@�ݹ:t�o��{�d`5�����/W^�m��g���B~ h�  ����l  נ�6rߙ�����^�?r���   ���⤖��  �!��#�3\?��/  �ݝRG��\�9;6���}P6������K>��V̒=l��n)��p	 ����0n䯂���}   ���S*	 ��t%ͤ+@�����T�~��s����oL)�J� 0>��W�-  �*N�%x=�8ikfV^���3�,�=�,}�<Z��T�+'��\�;x�Y���=���`}�y�>0����/'ـ�!z9�pQ��v/ֶ�Ǜ����㗬��9r���}��D���ל���	{�y����0&�Q����W��y ����l��.�LVZ��C���*W��v����r���cGk�
^�Ja%k��S���D"j���2���RW/������ض1 ����
.bVW&�gr��U\�+���!���m ;+۞�&�6]�4R�/��Y�L�Ά`"�sl,Y/��x��|&Dv�_
Q*� V�NWYu�%��-�&D�(&��"  Wc��ZS���(�x� ,�!����!�L�AM�E�]}X�!��wB�o��-  �-���16���i���ю�z��� ���B��oB�0������v]���ȓ�����3�� +S�χ�=Q_�����˨�d��|)D>��k ��uȣ���Y[9̂�����! ^�!��r���j0Y+i��΍e(�ț� ���x��
��{��<6 R���پ�b��Y
C����+���������;���a ���,�o��bC�{�?���1 �(��¤ �V�������;�=��I��� ���EI���Z��)D����t=S ��] X��9K�= �.~�K[��Ŋ��,2��� p}>w<n�g h�
�t���R�u�G�1k���!��x���������� �L���|>D�0�Ǣ(Qc�� ����= �ۊ�Z0�^��c �
|�����L�%�d��q���(�WB� ��(	���� �J��8D�0�~$�Dsy�Ѿ!������j�^ ��mOa�8.�qce��s|%Dq~,X�u�������=T	���Q�M�ȣm�Y�%Y+�[�0|"DΞ�j�u�L6�(Qe��qw�V�э���ǂ���!j�K � �:�wQ�dÛ������R�
��C���X�u�`����\"j讀Dq21� �F>B[��[������]@K-���C�e�q�tWP�:W�۞X�z��,��t�p���P��Se����T���{dG��
KA���w�t3t��[ܘ�4^>�5ŉ�^�n�Eq�U��Ӎ��α�v�O6C�
�F%�+8eů��M����hk��w�欹񔈓����C��y訫���J�Is�����Po|��{�Ѿ)+~�W��N,�ů��޽���O��J�_�w��N8����x�?�=X��t�R�BM�8���VSyI5=ݫ�	-�� �ֶ��oV�����G������3��D��aEI��ZI5�݋����t��b��j��G����U���΃�C�������ق�в����b���}s����xkn��`5�����>��M�Ev�-�͇\��|�=� '�<ތ�Ǜ���<O�LM�n.f>Z�,~��>��㷾�����x8���<x�����h}��#g�ж��������d�1xwp�yJO�v�	TV����گ�.�=��N����oK_={?-����@/�~�,��m ��9r.�6K_=�7#�SS����Ao�"�,TW+I��gt���F�;S���QW/�|�$�q#��W�Ƞ(�)H�W�}u�Ry�#���᎞�ͦ�˜QQ�R_��J}�O���w�����F[zjl�dn�`$� =�+cy��x3������U�d�d����v��,&FA&'kF�Y22�1z�W!�����1H�Y0&Ӎ W&^�O�NW�����U����-�|��|&HW������"�q����� ��#�R�$����?�~���� �z'F��I���w�'&����se���l�̂L�����-�P���s��fH�`�M��#H[�`,,s]��T����*Jqã��ł�� )-|yč��G�^J5]���e�hk�l;4�O��� ���[�������.��������������xm�p�w�չ�Y��(s�a�9[0Z�f&^��&�ks�w�s�_F^���2΂d��RU� �s��O0_\읅�,���2t�f�~�'t�p{$`6���WĽU.D"j�=�d��}��}���S["NB�_MxQCA[����\	�6}7Y����K���K6���{���Z۔s�2 �L�b�3��T��ݹ����&'ks����ܓ�ЛϾ�}f��,�Dq&������s��ϼ��{������&'k�����Qw窭�_i�+x�6ڥ��f�{j)���ퟎƍ3ou�R�Y����徙�k����X�Z
m.Y+=Z��m3�L47�j�3o�=�!J
5s���(��A ��t)���N�]68�u< Ƞ��_�im>d ��z(���(��⤶�� �&�ۥ� ��  Vc�8�'��qo9 �t��i�ρdn��Of���O�RQP���h'������P֡���n ���č����k�K@�>����pH>z)-|��B��j���!j:�+������˧��t�������1����.`v�M�k�q#�$���N:�����-M5a10y����(�T��� X5 \�:� ?+�7#�?�*Y+-,s� ~�|\)뀀ap �drn�g��RN�X�er ��@ĕ���;��z��8ɱ�����	�- �
�bKc����kt�U]�䎚���hgu���|�_J{ �`p��o�p�T�U��p���/���Hϑ�H�$X ܬm3���ŉ�U'��뻩t��G9�}�)O������p�΃g���JO���\9�׫�����ڳ�!k����/��9R���^�%��C����T���;ji<�>�KY����;�J��ƶm .P��pT��
@HA��r��98V���b�v���YwaZ>�$oւ?-փ��ʹ|0�.��3���b駁�c��;?8E;���V�B�؀����|%\\s��%����e{o��Z�i�������^���s�Jx������B jh�\ �h�<��V��sh@:���.�ІYl��˂�`3hE.,P�2^����J��+�����p��
�ЊJd��x�*�@�7R��� �"�G="!�� �p����u�o��wV�m�g���~F��?����/�����}~����sо7� ���\,,k�J�T�6������Z�y�rBZ[D�>v�HQ�R��mq�������DD�-6+�V`���J�E�����\� 9!ߑ�`��6���ml�~ZM�Z�ȎV���g���������3?*u3���ctW����YQa�Cb�P�,B5�p0�m�cͺEt�{,��>s9f�^��`OG��]����2�Fk�9_�G�vd��	��)��=�1^Ų�Wl3{�����1��H)�e������9�هZ�]}�b���)b�C��es}�cVi~x���e
Z�)܃��39������C�(�+R����!�j����F�n���<?�p��l�8a�4xOb��������c�8&�UA�|	/l�8�8���3t�6�͏���v���� ����סy�wU��`� =��|M�Y?�'�A��&�@*�c~!�/{��),�>�=xr"	�qlF:��L&���=<5t�h.�#ᣭ���O�z�!�&`A�F�yK=�c<\GZ�� 4HG�0i�F녠uB"���<��c�Jeۈ�3!����O��q萞PiZ&�$M[���(G��e���ؤ���ã��O���5����'�gH~�����=��g�F|8�+�X�4�u���G�2����'��.��5[�OlB��$f4���`��mS�L�,y�t&V�#P�3{ ��763�7N���"��P��I�X��BgV�n�a:$:�FZ���'�7����f������z!�����KA�G��D#������ˑ`ڶs���&� ݱ��4�j��n�� ݷ�~s��F�pD�LE�q+wX;t,�i�y��Y��A�۩`p�m#�x�kS�c��@bVL��w?��C�.|n{.gBP�Tr��v1�T�;"��v����XSS��(4�Ύ�-T�� (C�*>�-
�8��&�;��f;�[Փ���`,�Y�#{�lQ�!��Q��ّ�t9����b��5�#%<0)-%	��yhKx2+���V��Z� �j�˱RQF_�8M���{N]���8�m��ps���L���'��y�Ҍ}��$A`��i��O�r1p0�%��茮�:;�e���K A��qObQI,F�؟�o��A�\�V�����p�g"F���zy�0���9"� �8X�o�v����ߕڄ��E �5�3�J�ص�Ou�SbVis�I���ص�Z���ڒ�X��r�(��w��l��r"�`]�\�B���Ija:�O\���/�*]�þR������|���ʑ@�����W�8f�lA���Xl��촻�K<�dq1+x�*U�;�'�Vnl`"_L�3�B����u�����M���'�!-�<;S�F�܊�bSgq� ���Xt�肦�a��RZ�Y_ި��ZRSGA��-:8����yw_}XW�Z���-k�g.U��|�7P�
&���$˳��+��~?7�k�bQ���g������~�Z�e����H�-p�7S�� 
�w"XK�`K%?�`Tr|p���"��\�a�?�٧ ��'u�cv�&��<LM�Ud��T���Ak��������'+7��XR`��[\�-0���e�AiW]�Dk���$u���0[?�-���L����X�ĚSK-�.%�9=j�3t^���(c�yM-��/�ao����\%�?�б �~���b][
tٵ�<qF�)�
�J�'QZY�����*pB�I4�޸�,������.Т�1���/
t�1-1������E�*��Cl/Ю©f�<,0�S�bf�^���[8Z$��@���kw�M<?�[`��)3)1� �U����:��/pR��XV`XE,/0���d���1>ѫ��i�z��*o�}&R{���$f�JV=5͉Ύ��Rl�/�N4.�U~Cm�N~��HPRS�?G��g�-���qvT{�G _�[ua�;���kco�9�Kw����n����E{d�j��C���,q����Y���cwY<$#�ؤ�m+�LL-�z� �y<{/7���[��X�?�-6(cO ?�XZ�M�������sb�[
�.����j|;d�!0lCIqZ�z�&��~�|7�A���A~��á@�� 417��}t ��,� X�6��lS)6v�G
��I:�).~��8R���#'��߶;9�'���U�$1nC�L��찦3�+b黙u�NJ�����8���X�?5�0��^��[B/+�0�Ur(��J��+Xr�H�����HZm&�#�p	�Y ����*���hM]��m���b�ݢ����G����s��z-�x��������� �J�"���Ћ�g�Ҝ �Aа��?��?6��c�Zx�$�t��{s
-R�E�24�?�{�l�-��1�3S�EJ��v6X]L�B^ ��]N��R�yN��62�����'R�p-�����n2�d�?Th|�h��3X������Rc8&��_,��;T�8�� �hΗv�(7I;�3Obn;��O�!����Lߍ*�E~wU,���n�MN1���Z��Y̖��tY;5�^�<Z�Ǩ�T#�bt�xfA�n�cq����"9GD*�^JL��HJ���4���V�-�܉��4*��u]�[
���,"ҏ�i!�r~L��_�����8 ]j�?x���<k+%w��Bk��=�u�ڤ��>%2Bۃ�Y�n<jBo������Κ�0M~�t>�#b/jZ�}���B��Q��#���6R$v�����k�R$c/:�~���(V�7;)��ߊ[̣0?F��;.�*ݪd������{A`w>~�i=D�c��������Y2�X�q~�r2��8@v=f�?��X��S�"X�j?��@$?�����x�(�k���c7��\�����>A�=fpM?9d?�׻{���)f�.⪝���3�������f,N;"��,N���X��*�"V���"��C��?���(2=���A��1�Ul���h�8Ao(5X�B�X�>S�j��s�!
l����GgGp��>�v;c���V�N1���-��K�S�=6PiN�fNq������,
�3SWx�ei����f'�*�r�rʹ̙�e�7���b�o���>_i��M�_��V�p�r�9��X�$�����B���t5�4#�B(E���3�������`����I�M�e��b6_����{~�f/��@��B��Y����E�4��޲�d�O�$���M�����ݖv�P����TR�oj~��+}��#���"�]1Υ_���nR���œ����^pQ2�7첾b��3�ba�\��uu2�~O�G�����5�^>v������m��?���mC;$eT��C񎋋��V��8�:��
���ʱlt��~e]�cC7dl���.�i����\w����/..F�Q5���œ��`�o���E����E�͛�ٽ-�o�z�"n��/��[�����ͳI���S��Dڢ��V�6��!��esq��AC���ڻ���OMk�y��{7`c0�ٺ���5C5�yiw��`ps�OC��f�X�5oQ�\_*m�f�)稹"���a2$O;�]C�A�;V.���c��iޢ�R5�X��t%�s����ȸ�; 5�����)��X|?����9&��wĽjdn�{��7��/����q]3Ɲ�}�[��yF~�Q0����x��U�� ���˘?����a�;���/yޫ�����6.��C}���&L��9�_�ս�w�o���W�^�;�^u�xoݖ��Q8����4��kW��'����:9>����Xp5H��ONtL��=��_�&�0��H"Q��|H���4!���]�'�!޹Eܢ���}=soϢ~	K�$���`"!]j�+{'e�M��D]��=�>c��xS��Y����X��7�7+�Me̯/���u�Q����i���Eg�9�g�RU��#'��ޑW\r�aS�/3�"/v
IgX���}ٻ���ʏr�r���_��<�6�Gʋ&���z%�Pl^d����㑭v�ʎو�w�[���Q��k�K�����IWˈ��`/�Y�X��9J"��_��V{��je�i��6�<�ZS��� �t���W�Bg��@5���..��X�eʡ��*�HRgkD^>�y裝"�9�+wQ4ABR������^�k3�>2�����x�C�l���f:��#gщ�s� ��ߜ��ȁ���+���A��˾�g�1K9Cܹ��:���T"!I������Hs�;���ue��9@#ChE5&!��'�2�����w*a/Q��I	�E������I�w�����?��v })B��GQ�n�h"]0��]Z֑���.}�&~x2��
eĞsF�n�+�b�e�i����0Ix�y��Aѕ���
[1�B�R$$����:�4E疳��#�4���y���ӈ�6o1O�V'��7]�H�.)/)�OwW./�g�l��£���"$d���}[���t���U~�MQԲ�$��~��c��S�M�a���ш=��diH��(N�+U�D����f"V�"�����.ƈ�#Ͼ�eH:�x��d!k 6�J�f9�GW�4����Kp��T��3��~��G�؀��,�zZ��澰؋7����v#� &�r+O�@Ud7͐�$�\�D�O��W_�Ew�ͻ�7��oD����y��,��Ƣ�cƙd	���U�u�:�#�h6]�R
�U~	V�՟R�V������/�:r�F¬�k?|Ī�r\�<.�^9����?��]Aʻ�iT;vg�PpyM���1��},�dY\e8��I��2�wjM��S/�p�1�\^�6$4�F��(:�\nۢ�2�}�Pm�X�'.����U�3��bq�nXK�i_BD�_H}�r;Y^�t�<���o��#gw��2q_�|�^�<��E�h���O�����R�-Ɖ���S�	!��z�1�+iH�1G���+<����~�;|�F�{�}v�;s�j�Q;�٩�;&f�}�������tL ���#��Ъ>;��z���?U˽�~������e��{K%��/:F�/<�n�2k�8�x��S-�5�`��ԗ�H�{���R�y�S�(w��ѥe
�	0���w�޻�U1��7V-Q�̶ꪸ�g�X��3V&�T[+)b����2���(���B��,��z����9���B`��!��o�ע(�W�RZ���m��%/V�&��|g��f��*[_��nn��M�M`�%��)��Z�K$�����F�� ��$r^�k�K,	u;w������X���;�L�eoI�6��y%����~����)���0"�zc�BH�<�kW�E\.�b��R>mٺ��<����͑Թ���a=2X���=/��_;	Ρ�e&o.����]��2!�嫈�"I������j�höR��͒\L�0�e������,)ýf�; ��E��0��<%�Q�Aø�x8�� �]eQL�;|���꼬z�W2
�H�z�_��
/K`J�O�O�Y�~j���>����d�v��%�ެ7�4{%��٥7Z��>����|��5^�\ױ���:��Z^;��U��s�)��#�|�.̡���R2��j����şBб���*cMvD�W^{�������m�D��0�,������#���?O����
����?z�{ȓ'�|����/�����/�����/�����/�����/�����/�����/�����/|�           [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://hivi87qftnaj"
path="res://.godot/imported/index.png-c88c7c8dad918401bd2b9be0e2933010.ctex"
metadata={
"vram_texture": false
}
                GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
ScI_L �;����In#Y��0�p~��Z��m[��N����R,��#"� )���d��mG�������ڶ�$�ʹ���۶�=���mϬm۶mc�9��z��T��7�m+�}�����v��ح����mow�*��f�&��Cp�ȑD_��ٮ}�)� C+���UE��tlp�V/<p��ҕ�ig���E�W�����Sթ�� ӗ�A~@2�E�G"���~ ��5tQ#�+�@.ݡ�i۳�3�5�l��^c��=�x�Н&rA��a�lN��TgK㼧�)݉J�N���I�9��R���$`��[���=i�QgK�4c��%�*�D#I-�<�)&a��J�� ���d+�-Ֆ
��Ζ���Ut��(Q�h:�K��xZ�-��b��ٞ%+�]�p�yFV�F'����kd�^���:[Z��/��ʡy�����EJo�񷰼s�ɿ�A���N�O��Y��D��8�c)���TZ6�7m�A��\oE�hZ�{YJ�)u\a{W��>�?�]���+T�<o�{dU�`��5�Hf1�ۗ�j�b�2�,%85�G.�A�J�"���i��e)!	�Z؊U�u�X��j�c�_�r�`֩A�O��X5��F+YNL��A��ƩƗp��ױب���>J�[a|	�J��;�ʴb���F�^�PT�s�)+Xe)qL^wS�`�)%��9�x��bZ��y
Y4�F����$G�$�Rz����[���lu�ie)qN��K�<)�:�,�=�ۼ�R����x��5�'+X�OV�<���F[�g=w[-�A�����v����$+��Ҳ�i����*���	�e͙�Y���:5FM{6�����d)锵Z�*ʹ�v�U+�9�\���������P�e-��Eb)j�y��RwJ�6��Mrd\�pyYJ���t�mMO�'a8�R4��̍ﾒX��R�Vsb|q�id)	�ݛ��GR��$p�����Y��$r�J��^hi�̃�ūu'2+��s�rp�&��U��Pf��+�7�:w��|��EUe�`����$G�C�q�ō&1ŎG�s� Dq�Q�{�p��x���|��S%��<
\�n���9�X�_�y���6]���մ�Ŝt�q�<�RW����A �y��ػ����������p�7�l���?�:������*.ո;i��5�	 Ύ�ș`D*�JZA����V^���%�~������1�#�a'a*�;Qa�y�b��[��'[�"a���H�$��4� ���	j�ô7�xS�@�W�@ ��DF"���X����4g��'4��F�@ ����ܿ� ���e�~�U�T#�x��)vr#�Q��?���2��]i�{8>9^[�� �4�2{�F'&����|���|�.�?��Ȩ"�� 3Tp��93/Dp>ϙ�@�B�\���E��#��YA 7 `�2"���%�c�YM: ��S���"�+ P�9=+D�%�i �3� �G�vs�D ?&"� !�3nEФ��?Q��@D �Z4�]�~D �������6�	q�\.[[7����!��P�=��J��H�*]_��q�s��s��V�=w�� ��9wr��(Z����)'�IH����t�'0��y�luG�9@��UDV�W ��0ݙe)i e��.�� ����<����	�}m֛�������L ,6�  �x����~Tg����&c�U��` ���iڛu����<���?" �-��s[�!}����W�_�J���f����+^*����n�;�SSyp��c��6��e�G���;3Z�A�3�t��i�9b�Pg�����^����t����x��)O��Q�My95�G���;w9�n��$�z[������<w�#�)+��"������" U~}����O��[��|��]q;�lzt�;��Ȱ:��7�������E��*��oh�z���N<_�>���>>��|O�׷_L��/������զ9̳���{���z~����Ŀ?� �.݌��?�N����|��ZgO�o�����9��!�
Ƽ�}S߫˓���:����q�;i��i�]�t� G��Q0�_î!�w��?-��0_�|��nk�S�0l�>=]�e9�G��v��J[=Y9b�3�mE�X�X�-A��fV�2K�jS0"��2!��7��؀�3���3�\�+2�Z`��T	�hI-��N�2���A��M�@�jl����	���5�a�Y�6-o���������x}�}t��Zgs>1)���mQ?����vbZR����m���C��C�{�3o��=}b"/�|���o��?_^�_�+��,���5�U��� 4��]>	@Cl5���w��_$�c��V��sr*5 5��I��9��
�hJV�!�jk�A�=ٞ7���9<T�gť�o�٣����������l��Y�:���}�G�R}Ο����������r!Nϊ�C�;m7�dg����Ez���S%��8��)2Kͪ�6̰�5�/Ӥ�ag�1���,9Pu�]o�Q��{��;�J?<�Yo^_��~��.�>�����]����>߿Y�_�,�U_��o�~��[?n�=��Wg����>���������}y��N�m	n���Kro�䨯rJ���.u�e���-K��䐖��Y�['��N��p������r�Εܪ�x]���j1=^�wʩ4�,���!�&;ج��j�e��EcL���b�_��E�ϕ�u�$�Y��Lj��*���٢Z�y�F��m�p�
�Rw�����,Y�/q��h�M!���,V� �g��Y�J��
.��e�h#�m�d���Y�h�������k�c�q��ǷN��6�z���kD�6�L;�N\���Y�����
�O�ʨ1*]a�SN�=	fH�JN�9%'�S<C:��:`�s��~��jKEU�#i����$�K�TQD���G0H�=�� �d�-Q�H�4�5��L�r?����}��B+��,Q�yO�H�jD�4d�����0*�]�	~�ӎ�.�"����%
��d$"5zxA:�U��H���H%jس{���kW��)�	8J��v�}�rK�F�@�t)FXu����G'.X�8�KH;���[          [remap]

importer="texture"
type="CompressedTexture2D"
uid="uid://c2kyv3cp3t5x"
path="res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex"
metadata={
"vram_texture": false
}
 extends Control

var sent_attribute:String

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_check_button_toggled(value):
	$ScormNode.emmit_return_on_set = value


func _on_score_button_pressed():
	$ScormNode._setScormValue("cmi.score.scaled",$VBoxContainer/HBoxContainer/Score.value/100)




func _on_scorm_node_get_scorm_value(atribute, value):
	match(atribute):
		"cmi.score.scaled":
			$VBoxContainer/HBoxContainer/Result.text = value
		"completion_status":
			$VBoxContainer/HBoxContainer2/Result.text = value
		sent_attribute:
			$VBoxContainer/HBoxContainer3/Result.text = value
		


func _on_button_pressed():
	$VBoxContainer/HBoxContainer/Result.text = $ScormNode._getScormValue("cmi.score.scaled")


func _on_pass_button_toggled(toggled_on):
	if(toggled_on):
		$ScormNode._setScormValue("cmi.completion_status", 'completed')
	else:
		$ScormNode._setScormValue("cmi.completion_status", 'failed')


func _on_button_pass_pressed():
	$VBoxContainer/HBoxContainer2/Result.text = $ScormNode._getScormValue("cmi.completion_status")


func _on_sent_button_pressed():
	sent_attribute = $VBoxContainer/HBoxContainer3/VBoxContainer/HBoxContainer/TextEdit.text
	$ScormNode._setScormValue(sent_attribute, $VBoxContainer/HBoxContainer3/VBoxContainer/HBoxContainer2/TextValue.text)


func _on_button_cusrt_pressed():
	$VBoxContainer/HBoxContainer3/Result.text = $ScormNode._getScormValue(sent_attribute)
 RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://TestScorm.gd ��������   Script !   res://addons/scorm/scorm_node.gd ��������      local://PackedScene_3mlhl B         PackedScene          	         names "   4   
   TestScorm    layout_mode    anchors_preset    anchor_right    anchor_bottom    grow_horizontal    grow_vertical    script    Control 
   ScormNode    Node    CheckButton    anchor_left    offset_left    offset_top    offset_right    offset_bottom    text    VBoxContainer    anchor_top    HBoxContainer    Label    Score    SpinBox    ScoreButton    size_flags_horizontal    size_flags_vertical    Button    VSeparator    custom_minimum_size    ResultLabel    Result    HBoxContainer2    PassButton    HBoxContainer3 	   TextEdit    placeholder_text    LabelValue 
   TextValue    CenterContainer    SentButton    _on_scorm_node_get_scorm_value    getScormValue    _on_check_button_toggled    toggled    _on_score_button_pressed    pressed    _on_button_pressed    _on_pass_button_toggled    _on_button_pass_pressed    _on_sent_button_pressed    _on_button_cusrt_pressed    	   variants    $                    �?                                           ?     ��     �B     �B     �B      Auto Refresh on Send            |�    ��     |C     &�      Score:             Send
 
     �B       	   Current: 
     �B          Refresh       Pass: 
     aC          Custom Prop: 
     HC  �A      cmi.attribute       Value: 
     pB  �A      value 
     ;C          Submit       node_count              nodes     �  ��������       ����                                                          
   	   ����                           ����
                              	      
                                             ����                                                                                            ����                          ����                                ����                          ����                                            ����                                ����                                      ����                                ����                                 ����                       !   ����                                ����                                ����                                ����                                ����                             "   ����                          ����                          ����                          ����                          #   #   ����               $                        ����                       %   ����                          #   &   ����                $   !              '   '   ����      "                       (   ����                        #                    ����                          ����                                ����                                ����                         conn_count             conns     8          *   )                     ,   +                     .   -                     .   /                     ,   0                     .   1                     .   2                     .   3                    node_paths              editable_instances              version             RSRC[remap]

path="res://.godot/exported/133200997/export-8b6fc8cd62edb7e5068a5660e6906324-TestScorm.scn"
          list=Array[Dictionary]([{
"base": &"EditorExportPlugin",
"class": &"ScormExport",
"icon": "",
"language": &"GDScript",
"path": "res://addons/scorm/export.gd"
}])
              <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             �M�0F�k   res://addons/scorm/scorm.svg���gt(   res://release/index.apple-touch-icon.png�(�fw��&   res://release/index.icon.png���D�   res://release/index.pngo�t���   res://icon.svg��L1`�   res://TestScorm.tscn           ECFG      application/config/name         Scormplugin    application/run/main_scene         res://TestScorm.tscn   application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg     editor_plugins/enabled,   "         res://addons/scorm/plugin.cfg   #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility              