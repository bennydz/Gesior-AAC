<?PHP
date_default_timezone_set('America/Sao_Paulo');
ob_start('ob_gzhandler');
header('Connection: close');
if(!isset($_SERVER['HTTP_X_REQUESTED_WITH']) || $_SERVER['HTTP_X_REQUESTED_WITH'] != 'XMLHttpRequest')
	exit();

header('X-Ajax-Cip-Response-Type: Container');

include("../config/config.php");

$conn = mysql_pconnect('localhost', 'root', 'Jqzy3GTdpeUBCeWW') or die();
mysql_select_db($config['site']['sqlBD']);

function f($e) {
	die('{"AjaxObjects": [{"DataType": "Attributes","Data": "style=background-image:url(account/nok.gif)","Target": "#accountname_indicator"},{"DataType": "HTML","Data": "'.$e.'","Target": "#accountname_errormessage"},{"DataType": "Attributes","Data": "class=red","Target": "#accountname_label"}]}');
}

$s = isset($_POST['a_AccountName']) ? $_POST['a_AccountName'] : '';

if($s == '')
	f('Please enter an account name!');
elseif(strlen($s) < 3)
	f('This account name is too short!');
elseif(strlen($s) > 30)
	f('This account name is too long!');

$s = strtoupper($s);

if(!ctype_alnum($s))
	f('This account name has an invalid format. Your account name may only consist of numbers 0-9 and letters A-Z!');
#elseif(!preg_match('/[A-Z]/', $s))
#f('Your account name must include at least one letter A-Z!');

$acc_name = mysql_escape_string($s);
$check_account = mysql_query("SELECT `id` FROM `accounts` WHERE `name` = '$acc_name' LIMIT 1");

if(mysql_num_rows($check_account) != 0)
	f('This account name is already used. Please select another one!');

echo '{"AjaxObjects": [{"DataType": "Attributes","Data": "style=background-image:url(account/ok.gif);","Target": "#accountname_indicator"},{"DataType": "HTML","Data": "","Target": "#accountname_errormessage"},{"DataType": "Attributes","Data": "class=","Target": "#accountname_label"}]}';
ob_end_flush();
?>