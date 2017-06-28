<?php
if(!defined('INITIALIZED'))
	exit;
require 'config/namesblocked.php';
if(!$logged) {
    $voc = array(); // Rookgard Active !

    if (isset($_POST['step']) && $_POST['step'] == 'docreate') {
        $erro = array();

        # Nome da conta
        $accountname = isset($_POST['accountname']) ? $_POST['accountname'] : '';

        if ($accountname == '')
            $erro['acc'] = 'Please enter an account name!';
        elseif (strlen($accountname) < 3)
            $erro['acc'] = 'This account name is too short!';
        elseif (strlen($accountname) > 30)
            $erro['acc'] = 'This account name is too long!';
        else {
            $accountname = strtoupper($accountname);

            if (!ctype_alnum($accountname))
                $erro['acc'] = 'This account name has an invalid format. Your account name may only consist of numbers 0-9 and letters A-Z!';
            elseif (!preg_match('/[A-Z0-9]/', $accountname))
                $erro['acc'] = 'Your account name must include at least one letter A-Z!';
            else {
                $acc = new Account($accountname, Account::LOADTYPE_NAME);
                if ($acc->isLoaded())
                    $erro['acc'] = 'This account name is already used. Please select another one!';
            }
        }

        /*# Nome do personagem
        $charactername = isset($_POST['name']) ? trim($_POST['name']) : '';

        if(empty($charactername))
            $erro['name'] = 'Please enter a name for your character!';
        elseif(strlen($charactername) < 2 || strlen($charactername) > 29)
            $erro['name'] = 'A name must have at least 2 but no more than 29 letters!';
        elseif(preg_match('/[^a-zA-Z ]/', $charactername))
            $erro['name'] = 'This name contains invalid letters. Please use only A-Z, a-z and space!';
        elseif(!ctype_upper($charactername[0]))
            $erro['name'] = 'The first letter of a name has to be a capital letter!';
        elseif(strpos($charactername, '  ') !== false)
            $erro['name'] = 'This name contains more than one space between words. Please use only one space between words!';
        else {

            foreach(explode(' ', $charactername) as $k =>$v) {
                $words[$k] = str_split($v);
                $len = strlen($v);
                if($len == 1) {
                    $erro['name'] = 'This name contains a word with only one letter. Please use more than one letter for each word!';
                    break;
                }
                elseif($len > 14) {
                    $erro['name'] = 'This name contains a word that is too long. Please use no more than 14 letters for each word!';
                    break;
                }
            }

            if(!isset($e['name'])) {
                $total = 0;
                foreach($words as $k =>$p) {
                    if(isset($erro['name']))
                        break;
                    $total++;
                    if($total > 3) {
                        $erro['name'] = 'This name contains more than 3 words. Please choose another name!';
                        break;
                    }
                    $len = 0;
                    foreach($p as $i =>$j) {
                        $len++;
                        if($i != 0 && ctype_upper($j)) {
                            $erro['name'] = 'In names capital letters are only allowed at the beginning of a word!';
                            break;
                        }
                        elseif($i == $len-1) {
                            $ff = null;
                            for($h = 0; $h < strlen($v); $h++) {
                                if(in_array(strtolower($v[$h]), array('a','e','i','o','u')) !== false) {
                                    $ff = true;
                                    break;
                                }
                            }
                            if(!$ff) {
                                $erro['name'] = 'This name contains a word without vowels. Please choose another name!';
                                break;
                            }
                        }
                    }
                }
            }

            if(!isset($erro['name'])) {
                $charactername = strtolower($charactername);
                for($i = 0; $i < strlen($charactername); $i++)
                    if($charactername[$i] == $charactername[($i+1)] && $charactername[$i] == $charactername[($i+2)]) {
                        $erro['name'] = 'This character name is already used. Please select another one!';
                        break;
                    }
            }
            if(!isset($erro['name'])) {
                foreach($nomesBloqueados as $v)
                    if(strpos($charactername, $v) !== false) {
                        $erro['name'] = 'This character name can not be used. Please select another one!';
                        break;
                    }
            }
            if(!isset($erro['name'])) {
                $ple = new Player($charactername, Player::LOADTYPE_NAME);
                if($ple->isLoaded())
                    $erro['name'] = 'This character name is already used. Please select another one!';
            }
        }

        if(!isset($_POST['sex']) || ($_POST['sex'] != 'male' && $_POST['sex'] != 'female'))
            $erro['sex'] = 'Please select the sex for your character!';

        if(count($voc) != 0 && (!isset($_POST['vocation']) || !is_numeric($_POST['vocation']) || !isset($voc[$_POST['vocation']])))
            $erro['vocation'] = 'Please select the vocation for your character!';*/

        $email = isset($_POST['email']) ? $_POST['email'] : '';

        if ($email == '')
            $erro['email'] = 'Please enter your email address!';
        elseif (strlen($email) > 49)
            $erro['email'] = 'Your email address is too long!';
        elseif (!filter_var($email, FILTER_VALIDATE_EMAIL))
            $erro['email'] = 'This email address has an invalid format. Please enter a correct email address!';
        else {
            $accMailCheck = new Account($email, Account::LOADTYPE_MAIL);
            if ($accMailCheck->isLoaded())
                $erro['email'] = 'This email address is already used. Please enter another email address!';
        }

        $password1 = isset($_POST['password1']) ? $_POST['password1'] : '';
        $password2 = isset($_POST['password2']) ? $_POST['password2'] : '';

        if (empty($password2))
            $erro['pass'] = 'Please enter the password again!';
        elseif ($password1 != $password2)
            $erro['pass'] = 'The two passwords do not match!';
        else {
            $err = array();
            if (strlen($password1) < 6 || strlen($password1) > 29)
                $err[] = 'The password must have at least 8 and less than 30 letters!';
            if (!ctype_alnum($password1))
                $err[] = 'The password contains invalid letters!';

            if (count($err) != 0) {
                $erro['pass'] = '';
                for ($i = 0; $i < count($err); $i++)
                    $erro['pass'] .= ($i == 0 ? '' : '<br/>') . $err[$i];
            }
        }

        if (!isset($_POST['agreeagreements']) || empty($_POST['agreeagreements']))
            $erro['rules'] = 'You have to agree to the ' . $config['server']['serverName'] . ' Rules in order to create an account!';

        if (count($erro) != 0) {
            $main_content = '<div class="SmallBox"><div class="MessageContainer"><div class="BoxFrameHorizontal" style="background-image:url(' . $layout_name . '/images/global/content/box-frame-horizontal.gif)"/></div><div class="BoxFrameEdgeLeftTop" style="background-image:url(' . $layout_name . '/images/global/content/box-frame-edge.gif)"/></div><div class="BoxFrameEdgeRightTop" style="background-image:url(' . $layout_name . '/images/global/content/box-frame-edge.gif)"/></div><div class="ErrorMessage"><div class="BoxFrameVerticalLeft" style="background-image:url(' . $layout_name . '/images/global/content/box-frame-vertical.gif)"/></div><div class="BoxFrameVerticalRight" style="background-image:url(' . $layout_name . '/images/global/content/box-frame-vertical.gif)"/></div><div class="AttentionSign" style="background-image:url(' . $layout_name . '/images/global/content/attentionsign.gif)"/></div><b>The Following Errors Have Occurred:</b><br/>';
            foreach ($erro as $error) $main_content .= $error . '<br/>';
            $main_content .= '</div><div class="BoxFrameHorizontal" style="background-image:url(' . $layout_name . '/images/global/content/box-frame-horizontal.gif)"/></div><div class="BoxFrameEdgeRightBottom" style="background-image:url(' . $layout_name . '/images/global/content/box-frame-edge.gif)"/></div><div class="BoxFrameEdgeLeftBottom" style="background-image:url(' . $layout_name . '/images/content/global/box-frame-edge.gif)"/></div></div></div><br/>';
        } else {
            $reg_account = new Account();
            $reg_account->setName(strtoupper($_POST['accountname']));
            $reg_account->setPassword($_POST['password1']);
            $reg_account->setEMail($_POST['email']);
            $reg_account->setCreateDate(time());
            $reg_account->setCreateIP(Visitor::getIP());
            $reg_account->setFlag(Website::getCountryCode(long2ip(Visitor::getIP())));
            $reg_account->save();

            /*if($reg_account->getID() > 0) {
                $sample = (count($voc) == 0 ? 'Rook' : $voc[$_POST['vocation']]).' Sample';
                $char_to_copy = new Player();
                $char_to_copy->find($sample);
                if(!$char_to_copy->isLoaded())
                    die('Missing sample character ('.$sample.')');
                $char_to_copy->getItems()->load();
                $char_to_copy->setLookType(($_POST['sex'] == 'female' ? 136 : 128));
                $char_to_copy->setID(null); // save as new character
                $char_to_copy->setLastIP(0);
                $char_to_copy->setLastLogin(0);
                $char_to_copy->setLastLogout(0);
                $char_to_copy->setName($_POST['name']);
                $char_to_copy->setAccount($reg_account);
                $char_to_copy->setSex(($_POST['sex'] == 'female' ? 0 : 1));
                $char_to_copy->setPosX(0);
                $char_to_copy->setPosY(0);
                $char_to_copy->setPosZ(0);
                $char_to_copy->setCreateIP(Visitor::getIP());
                $char_to_copy->setCreateDate(time());
                $char_to_copy->setSave(); // make character saveable
                $char_to_copy->save(); // now it will load 'id' of new player
            }*/
            //show information about registration
            if ($config['site']['send_emails']) {
                $reg_name = $reg_account->getName();
                $reg_email = $reg_account->getEMail();
                $mailBody = '<html>
			<body>
			<h3>Your account name and password!</h3>
			<p>You or someone else registred on server <a href="' . $config['server']['url'] . '"><b>' . htmlspecialchars($config['server']['serverName']) . '</b></a> with this e-mail.</p>
			<p>Account name: <b>' . htmlspecialchars($reg_name) . '</b></p>			
			<br />
			<p>After login you can:</p>
			<li>Create new characters
			<li>Change your current password
			<li>Change your current e-mail
			</body>
			</html>';
                $mail = new PHPMailer();
                if ($config['site']['smtp_enabled']) {
                    $mail->IsSMTP();
                    $mail->Host = $config['site']['smtp_host'];
                    $mail->Port = (int)$config['site']['smtp_port'];
                    $mail->SMTPAuth = $config['site']['smtp_auth'];
                    $mail->Username = $config['site']['smtp_user'];
                    $mail->Password = $config['site']['smtp_pass'];
                    if ($config['site']['smtp_secure']) {
                        if ((int)$config['site']['smtp_port'] == 465)
                            $mail->SMTPSecure = "ssl";
                        else
                            $mail->SMTPSecure = "tls";
                    }

                    $mail->FromName = $config['site']['mail_senderName'];
                    $mail->IsHTML(true);
                    $mail->From = $config['site']['mail_address'];
                    $mail->AddAddress($reg_email);
                    $mail->Subject = $config['server']['serverName'] . " - Registration";
                    $mail->Body = $mailBody;
                }

                if ($mail->Send()) {
                    //$main_content .= 'Your account has been created. Check your e-mail. See you in ' . htmlspecialchars($config['server']['serverName']) . '!<BR><BR>';
                    $main_content .= '<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
				<TR><TD BGCOLOR="' . $config['site']['vdarkborder'] . '" CLASS=white><B>Account Created</B></TD></TR>
				<TR><TD BGCOLOR="' . $config['site']['darkborder'] . '">
				  <TABLE BORDER=0 CELLPADDING=1><TR><TD>
				    <BR>Your account name is <b>' . $reg_name . '</b>.
					<BR><b><i>You will receive e-mail at (<b>' . htmlspecialchars($reg_email) . '</b>) with your account details.</b></i><br>';
                    $main_content .= 'You will need the account name and your password to play on ' . htmlspecialchars($config['server']['serverName']) . '.
				    Please keep your account name and password in a safe place and
				    never give your account name or password to anybody.<BR><BR>
				    <br /><small>If these information do not arrive on <b>' . htmlspecialchars($reg_email) . ' in the next few minutes</b>. Please check your spam folder and add our address to your e-mail contact list.
                    </small>
                    </TD></TR></TABLE>
                    </TD></TR></TABLE>';

                }
                else{
                    $main_content .= '<h2>Your account has been created.</h2>';
                    error_log('Error sending e-mail: '.$mail->ErrorInfo,1);
                }
            } else header("Location: ?subtopic=latestnews");

        }

    } else {//$_POST['step'] = '';

        $main_content .= '
			<script src="' . $layout_name . '/create_character.js"></script>
			<div style="position:relative;top:0px;left:0px;" >
				<form action="?subtopic=createaccount" method=post name="CreateAccountAndCharacter" >
					<div class="TableContainer" >
						<table class="Table5" cellpadding="0" cellspacing="0" >
							<div class="CaptionContainer" >
								<div class="CaptionInnerContainer" > 
									<span class="CaptionEdgeLeftTop" style="background-image:url(' . $layout_name . '/images/global/content/box-frame-edge.gif);" /></span>
									<span class="CaptionEdgeRightTop" style="background-image:url(' . $layout_name . '/images/global/content/box-frame-edge.gif);" /></span>
									<span class="CaptionBorderTop" style="background-image:url(' . $layout_name . '/images/global/content/table-headline-border.gif);" ></span> 
									<span class="CaptionVerticalLeft" style="background-image:url(' . $layout_name . '/images/global/content/box-frame-vertical.gif);" /></span>								
									<div class="Text" >Create New Account</div>
									<span class="CaptionVerticalRight" style="background-image:url(' . $layout_name . '/images/global/content/box-frame-vertical.gif);" /></span>
									<span class="CaptionBorderBottom" style="background-image:url(' . $layout_name . '/images/global/content/table-headline-border.gif);" ></span> 
									<span class="CaptionEdgeLeftBottom" style="background-image:url(' . $layout_name . '/images/global/content/box-frame-edge.gif);" /></span>
									<span class="CaptionEdgeRightBottom" style="background-image:url(' . $layout_name . '/images/global/content/box-frame-edge.gif);" /></span>
								</div>
							</div>';
        //Account
        $main_content .= '
							<tr>
								<td>
									<div class="InnerTableContainer" >
										<table style="width:100%;" >
											<tr>
												<td>
													<div class="TableShadowContainerRightTop" >
														<div class="TableShadowRightTop" style="background-image:url(' . $layout_name . '/images/global/content/table-shadow-rt.gif);" ></div>
													</div>
													<div class="TableContentAndRightShadow" style="background-image:url(' . $layout_name . '/images/global/content/table-shadow-rm.gif);" >
														<div class="TableContentContainer" >
															<table class="TableContent" width="100%"  style="border:1px solid #faf0d7;" >
																<tr>
																	<td class="LabelV150" >
																		<span id="accountname_label"' . (isset($e['acc']) ? ' class="red"' : '') . ' >Account Name:</span>
																	</td>
																	<td>
																		<input id="accountname" name="accountname" class="CipAjaxInput" style="width:206px;float:left;" value="' . (isset($_POST['accountname']) ? htmlspecialchars(substr($_POST['accountname'], 0, 30)) : '') . '" size="30" maxlength="30" onBlur="SendAjaxCip({DataType: \'Container\'}, {Href: \'./ajax_account.php\',PostData: \'a_AccountName=\'+getElementById(\'accountname\').value,Method: \'POST\'});" />
																		<div id="accountname_indicator" class="InputIndicator" style="background-image:url(' . $layout_name . '/images/global/general/' . ($_POST['step'] != 'docreate' || isset($e['acc']) ? 'n' : '') . 'ok.gif);" ></div>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td><span id="accountname_errormessage" class="FormFieldError">' . (isset($e['acc']) ? $e['acc'] : '') . '</span></td>
																</tr>
																<tr>
																	<td class="LabelV150" >
																		<span id="email_label"' . (isset($e['email']) ? ' class="red"' : '') . '>Email Address:</span>
																	</td>
																	<td>
																		<input id="email" name="email" class="CipAjaxInput" style="width:206px;float:left;" value="' . (isset($_POST['email']) ? htmlspecialchars(substr($_POST['email'], 0, 50)) : '') . '" size="30" maxlength="50" onBlur="SendAjaxCip({DataType: \'Container\'}, {Href: \'./ajax_email.php\',PostData: \'a_EMail=\'+encodeURIComponent(getElementById(\'email\').value),Method: \'POST\'});" />
																		<div id="email_indicator" class="InputIndicator" style="background-image:url(' . $layout_name . '/images/global/general/' . ($_POST['step'] != 'docreate' || isset($e['email']) ? 'n' : '') . 'ok.gif);" ></div>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td><span id="email_errormessage" class="FormFieldError">' . (isset($e['email']) ? $e['email'] : '') . '</span></td>
																</tr>
																<tr>
																	<td class="LabelV150" >
																		<span id="password1_label"' . (isset($e['pass']) ? ' class="red"' : '') . '>Password:</span>
																	</td>
																	<td>
																		<input id="password1" type="password" name="password1" style="width:206px;float:left;" value="' . (isset($_POST['password1']) ? htmlspecialchars(substr($_POST['password1'], 0, 30)) : '') . '" size="30" maxlength="30" onBlur="SendAjaxCip({DataType: \'Container\'}, {Href: \'./account/ajax_password.php\',PostData: \'a_Password1=\'+getElementById(\'password1\').value+\'&a_Password2=\'+getElementById(\'password2\').value,Method: \'POST\'});" />
																		<div id="password1_indicator" class="InputIndicator" style="background-image:url(' . $layout_name . '/images/global/general/' . ($_POST['step'] != 'docreate' || isset($e['pass']) ? 'n' : '') . 'ok.gif);" ></div>
																	</td>
																</tr>
																<tr>
																	<td class="LabelV150" >
																		<span id="password2_label"' . (isset($e['pass']) ? ' class="red"' : '') . '>Password Again:</span>
																	</td>
																	<td>
																		<input id="password2" type="password" name="password2" style="width:206px;float:left;" value="' . (isset($_POST['password2']) ? htmlspecialchars(substr($_POST['password2'], 0, 30)) : '') . '" size="30" maxlength="30" onBlur="SendAjaxCip({DataType: \'Container\'}, {Href: \'./account/ajax_password.php\',PostData: \'a_Password1=\'+getElementById(\'password1\').value+\'&a_Password2=\'+getElementById(\'password2\').value,Method: \'POST\'});" />
																		<div id="password2_indicator" class="InputIndicator" style="background-image:url(' . $layout_name . '/images/global/general/' . ($_POST['step'] != 'docreate' || isset($e['pass']) ? 'n' : '') . 'ok.gif);" ></div>
																	</td>
																</tr>
																<tr>
																	<td></td>
																	<td><span id="password_errormessage" class="FormFieldError">' . (isset($e['pass']) ? $e['pass'] : '') . '</span></td>
																</tr>
															</table>
														</div>
													</div>
													<div class="TableShadowContainer" >
														<div class="TableBottomShadow" style="background-image:url(' . $layout_name . '/images/global/content/table-shadow-bm.gif);" >
															<div class="TableBottomLeftShadow" style="background-image:url(' . $layout_name . '/images/global/content/table-shadow-bl.gif);" ></div>
															<div class="TableBottomRightShadow" style="background-image:url(' . $layout_name . '/images/global/content/table-shadow-br.gif);" ></div>
														</div>
													</div>
												</td>
											</tr>';
        /*$main_content .= '
            <tr>
                <td>
                    <div class="TableShadowContainerRightTop" >
                        <div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/global/content/table-shadow-rt.gif);" ></div>
                    </div>
                    <div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/global/content/table-shadow-rm.gif);" >
                        <div class="TableContentContainer" >
                            <table class="TableContent" width="100%"  style="border:1px solid #faf0d7;" >
                                <tr>
                                    <td class="LabelV150" >
                                        <span id="charactername_label"'.(isset($e['name']) ? ' class="red"' : '').'>Character Name:</span>
                                    </td>
                                    <td>
                                        <input id="charactername" name="name" class="CipAjaxInput" style="width:206px;float:left;position:relative;" style="float:left;" value="'.(isset($_POST['name']) ? htmlspecialchars(str_replace('+', ' ', substr(trim($_POST['name']), 0, 30))) : '').'" size="30" maxlength="30" onBlur="SendAjaxCip({DataType: \'Container\'}, {Href: \'./account/ajax_charactername.php\',PostData: \'a_CharacterName=\'+this.value,Method: \'POST\'});" />
                                        <div id="charactername_indicator" class="InputIndicator" style="background-image:url('.$layout_name.'/images/global/general/'.($_POST['step'] != 'docreate' || isset($e['name']) ? 'n' : '').'ok.gif);" ></div>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td><span id="charactername_errormessage" class="FormFieldError">'.(isset($e['name']) ? $e['name'] : '').'</span></td>
                                </tr>
                                <tr>
                                    <td class="LabelV150" >
                                        <span'.(isset($e['sex']) ? ' class="red"' : '').'>Sex:</span>
                                    </td>
                                    <td>
                                        <table width="100%" >
                                            <tr>
                                                <td>
                                                    <span style="margin-right:75px;" class="OptionContainer" >
                                                        <label for="sex_male">
                                                            <span class="OptionContainer">
                                                                <input id="sex_male" type="radio" name="sex" value="male"'.(($_POST['sex'] == 'male' || $_POST['step'] != 'docreate') ? ' checked="checked"' : '').'/>
                                                                <label for="sex_male" >male</label>
                                                            </span>
                                                        </label>
                                                    </span>
                                                    <span class="OptionContainer" >
                                                        <label for="sex_female">
                                                            <span class="OptionContainer">
                                                                <input id="sex_female" type="radio" name="sex" value="female"'.($_POST['sex'] == 'female' ? ' checked="checked"' : '').'/>
                                                                <label for="sex_female" >female</label>
                                                            </span>
                                                        </label>
                                                    </span>
                                                    </td>
                                                <td><span class="FormFieldError">'.$e['sex'].'</span></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>';
                        if(count($voc) != 0) {
                            $main_content .= '
                                <tr>
                                    <td class="LabelV150" >
                                        <span'.(isset($e['vocation']) ? ' class="red"' : '').'>Vocation:</span>
                                    </td>
                                    <td>
                                        <table width="100%" >
                                            <tr>
                                                <td>';
                                            foreach($voc as $k => $v)
                                                $main_content .= '
                                                    <span style="margin-right:75px;" class="OptionContainer" >
                                                        <label for="sex_male">
                                                            <span class="OptionContainer">
                                                                <input id="vocation_'.$k.'" type="radio" name="vocation" value="'.$k.'"'.(!isset($_POST['vocation']) || $_POST['vocation'] == $k ? ' checked="checked"' : '').'/>
                                                                <label for="vocation_'.$k.'">'.$v.'</label>
                                                            </span>
                                                        </label>
                                                    </span>';
                                            $main_content .= '
                                                </td>
                                                <td><span class="FormFieldError">'.$e['vocation'].'</span></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>';
                        }
                        $main_content .= '
                            </table>
                        </div>
                    </div>
                    <div class="TableShadowContainer" >
                        <div class="TableBottomShadow" style="background-image:url('.$layout_name.'/images/global/content/table-shadow-bm.gif);" >
                            <div class="TableBottomLeftShadow" style="background-image:url('.$layout_name.'/images/global/content/table-shadow-bl.gif);" ></div>
                            <div class="TableBottomRightShadow" style="background-image:url('.$layout_name.'/images/global/content/table-shadow-br.gif);" ></div>
                        </div>
                    </div>
                </td>
            </tr>';*/
        $main_content .= '
											<tr>
												<td>
													<div class="TableShadowContainerRightTop" >
														<div class="TableShadowRightTop" style="background-image:url(' . $layout_name . '/images/global/content/table-shadow-rt.gif);" ></div>
													</div>
													<div class="TableContentAndRightShadow" style="background-image:url(' . $layout_name . '/images/global/content/table-shadow-rm.gif);" >
														<div class="TableContentContainer" >
															<table class="TableContent" width="100%"  style="border:1px solid #faf0d7;" >
																<tr>
																	<td><b>Please select the following check box:</b></td>
																</tr>
																<tr>
																	<td><input type="checkbox" name="agreeagreements" value="true"  onClick="if(this.checked == true) {  document.getElementById(\'agreeagreements_errormessage\').innerHTML = \'\';} else {  document.getElementById(\'agreeagreements_errormessage\').innerHTML = \'You have to agree to the ' . $config['server']['serverName'] . ' Rules in order to create an account!\';}"' . ($_POST['step'] == 'docreate' && !isset($e['rules']) ? ' checked="checked"' : '') . '/>
																		I agree to the <a href="?subtopic=malverarules" target="_blank" >' . $config['server']['serverName'] . ' Rules</a>.</td>
																</tr>
																<tr>
																	<td><span id="agreeagreements_errormessage" class="FormFieldError">' . (isset($e['rules']) ? $e['rules'] : '') . '</span></td>
																</tr>
															</table>
														</div>
													</div>
													<div class="TableShadowContainer" >
														<div class="TableBottomShadow" style="background-image:url(' . $layout_name . '/images/global/content/table-shadow-bm.gif);" >
															<div class="TableBottomLeftShadow" style="background-image:url(' . $layout_name . '/images/global/content/table-shadow-bl.gif);" ></div>
															<div class="TableBottomRightShadow" style="background-image:url(' . $layout_name . '/images/global/content/table-shadow-br.gif);" ></div>
														</div>
													</div>
												</td>
											</tr>';
        $main_content .= '
										</table>
									</div>
								</td>
							</tr>';
        $main_content .= '
						</table>
					</div>
					<br />
					<center>
						<table border="0" cellspacing="0" cellpadding="0" >
						<tr>
							<td style="border:0px;" >
								<input type="hidden" name=step value=docreate >
								<input type="hidden" name=noframe value= >
								<div class="BigButton" style="background-image:url(' . $layout_name . '/images/global/buttons/sbutton.gif)" >
									<div onMouseOver="MouseOverBigButton(this);" onMouseOut="MouseOutBigButton(this);" ><div class="BigButtonOver" style="background-image:url(' . $layout_name . '/images/global/buttons/sbutton_over.gif);" ></div>
										<input class="ButtonText" type="image" name="Submit" alt="Submit" src="' . $layout_name . '/images/global/buttons/_sbutton_submit.gif" >
									</div>
								</div>
							</td>
						<tr>
					</form>
				</table>
			</center>
		</form>
	</div>';
    }
}else header("Location: ./?subtopic=accountmanagement");