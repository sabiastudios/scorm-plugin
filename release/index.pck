GDPC                p                                                                         X   res://.godot/exported/133200997/export-8b6fc8cd62edb7e5068a5660e6906324-TestScorm.scn   P       �      <��?�^Ù���}G    ,   res://.godot/global_script_class_cache.cfg  `/             ��Р�8���8~$}P�    D   res://.godot/imported/icon.svg-218a8f2b3041327d8a5756f3a245f83b.ctex�      �      �Yz=������������    H   res://.godot/imported/scorm.svg-5ef9df02a692c31f070b46659f194ab4.ctex   �      v      K�U�f|��T��S/?�       res://.godot/uid_cache.bin  @3      �       ;�O)� ꪃ�B��       res://TestScorm.gd         +      5��I�G���å��       res://TestScorm.tscn.remap  �.      f       zU�U?gr�w���       res://addons/scorm/scorm.gd         �      z�>�����eO��~\    $   res://addons/scorm/scorm.svg.import `      �       ۙ���:�%	c�4�W�        res://addons/scorm/scorm_node.gd0	      L      ;SG�2p:Ԭ�����       res://icon.svg  �/      �      C��=U���^Qu��U3       res://icon.svg.import   `      �       �y"��%�?� +���       res://project.binary04      �      ��R�Z�|�:�{��                @tool
extends EditorPlugin



func _enter_tree():
	# Initialization of the plugin goes here.
	add_custom_type("ScormNode", "Node", preload("scorm_node.gd")
		, preload("scorm.svg"))


func _exit_tree():
	# Clean-up of the plugin goes here.
	remove_custom_type("ScormNode")

func _build():
	var manifest_file = FileAccess.open( "imsmanifest.xml", FileAccess.WRITE)

	var files = DirAccess.open(".")
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
<resource identifier="resource_1" type="webcontent" adlcp:scormType="sco" href="index.html">'
	for file in files.get_files():
		string += '<file href="'+file+'"/>'
	string += '</resource>
		</resources>
		</manifest>'
	manifest_file.store_string(string)
	manifest_file.close()
	return true
            GST2            ����                        >  RIFF6  WEBPVP8L)  /�pI�"�:��Z��(h�F�sv/��m�:����m������;@Dd����4@���=��oiۤ���H$�N��?�)5�z#�HKL�	A�}#�z<B�2x#�@��4��u�N��j���H� �V���
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
	JavaScriptBridge.eval("ScormProcessSetValue('"+attribute+"', '"+value+"')");
	var return_val = JavaScriptBridge.eval("ScormProcessGetValue('"+attribute+"');")
	if(emmit_return_on_set):
		getScormValue.emit(attribute,return_val)
	attributes[attribute] = return_val
	return return_val
	
func _getScormValue(attribute):
	var return_val = null
	if(attributes.has(attribute)):
		return_val = attributes[attribute]
	else:
		return_val = JavaScriptBridge.eval("ScormProcessGetValue('"+attribute+"');")
		attributes[attribute] = return_val
	getScormValue.emit(attribute,return_val)
	return return_val
    GST2   �   �      ����               � �        �  RIFF�  WEBPVP8L�  /������!"2�H�$�n윦���z�x����դ�<����q����F��Z��?&,
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
	$ScormNode._setScormValue("cmi.score.scaled",$VBoxContainer/HBoxContainer/Score.value)




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
     RSRC                    PackedScene            ��������                                                  resource_local_to_scene    resource_name 	   _bundled    script       Script    res://TestScorm.gd ��������   Script !   res://addons/scorm/scorm_node.gd ��������      local://PackedScene_3mlhl B         PackedScene          	         names "   4   
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
          list=Array[Dictionary]([])
     <svg height="128" width="128" xmlns="http://www.w3.org/2000/svg"><rect x="2" y="2" width="124" height="124" rx="14" fill="#363d52" stroke="#212532" stroke-width="4"/><g transform="scale(.101) translate(122 122)"><g fill="#fff"><path d="M105 673v33q407 354 814 0v-33z"/><path fill="#478cbf" d="m105 673 152 14q12 1 15 14l4 67 132 10 8-61q2-11 15-15h162q13 4 15 15l8 61 132-10 4-67q3-13 15-14l152-14V427q30-39 56-81-35-59-83-108-43 20-82 47-40-37-88-64 7-51 8-102-59-28-123-42-26 43-46 89-49-7-98 0-20-46-46-89-64 14-123 42 1 51 8 102-48 27-88 64-39-27-82-47-48 49-83 108 26 42 56 81zm0 33v39c0 276 813 276 813 0v-39l-134 12-5 69q-2 10-14 13l-162 11q-12 0-16-11l-10-65H447l-10 65q-4 11-16 11l-162-11q-12-3-14-13l-5-69z"/><path d="M483 600c3 34 55 34 58 0v-86c-3-34-55-34-58 0z"/><circle cx="725" cy="526" r="90"/><circle cx="299" cy="526" r="90"/></g><g fill="#414042"><circle cx="307" cy="532" r="60"/><circle cx="717" cy="532" r="60"/></g></g></svg>
             �M�0F�k   res://addons/scorm/scorm.svgo�t���   res://icon.svg��L1`�   res://TestScorm.tscn�H�Q�W   res://release/index.icon.png3`N�Y(   res://release/index.apple-touch-icon.png���ܗX>   res://release/index.png           ECFG      application/config/name         Scormplugin    application/run/main_scene         res://TestScorm.tscn   application/config/features(   "         4.2    GL Compatibility       application/config/icon         res://icon.svg     editor_plugins/enabled,   "         res://addons/scorm/plugin.cfg   #   rendering/renderer/rendering_method         gl_compatibility*   rendering/renderer/rendering_method.mobile         gl_compatibility              