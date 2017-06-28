<?php
if(!defined('INITIALIZED'))
	exit;

$main_content .= '
	All players have to respect the following code of conduct, so-called "'.$config['server']['serverName'].' Rules".<BR>
	<BR>
	<TABLE WIDTH=100% BORDER=0 CELLSPACING=1 CELLPADDING=4>
		<TR>
			<TD BGCOLOR="#505050" CLASS=white><B>'.$config['server']['serverName'].' Rules</B></TD>
		</TR>
			<TR>
		
			<TD BGCOLOR="#D4C0A1">
		
		<TABLE WIDTH=100% BORDER=0 CELLPADDING=8>
			<TR><TD>
				Tibia is an online role-playing game in which thousands of players from all over the world meet everyday. In order to ensure that the game is fun for everyone, '.$config['server']['serverName'].' expects all players to behave in a reasonable and respectful manner.<br>
				<br>
				'.$config['server']['serverName'].' reserves the right to stop destructive behaviour in the game, on the official website or in any other part of '.$config['server']['serverName'].'\'s services. Such behaviour includes, but is not limited to, the following offences:<br>
				<br>
				<table border=0 cellpadding=0 cellspacing=0 width=100%>
						<tr>
					
					<td width=15></td>
						<td>
					
					<table border=0 cellpadding=0 cellspacing=2 width=100%>
						<tr>
							<td><b>1.</b></td>
							<td><b>Names</b></td>
						</tr>
						<tr>
							<td></td>
							<td><table border=0 cellpadding=0 cellspacing=3 width=100%>
									<tr>
										<td valign="top"><b>a)</b></td>
										<td><b>Offensive Name</b><br>
											Names that are insulting, racist, sexually related, drug-related, harassing or generally objectionable.</td>
									</tr>
									<tr>
										<td valign="top"><b>b)</b></td>
										<td><b>Invalid Name Format</b><br>
											Names that contain parts of sentences (except for guild names), badly formatted words or nonsensical combinations of letters.</td>
									</tr>
									<tr>
										<td valign="top"><b>c)</b></td>
										<td><b>Name Containing Forbidden Advertising</b><br>
											Names that advertise brands, products or services of third parties, content which is not related to the game or trades for real money.</td>
									</tr>
									<tr>
										<td valign="top"><b>d)</b></td>
										<td><b>Unsuitable Name</b><br>
											Names that express religious or political views or generally do not fit into '.$config['server']['serverName'].'\'s medieval fantasy setting. </td>
									</tr>
									<tr>
										<td valign="top"><b>e)</b></td>
										<td><b>Name Supporting Rule Violation</b><br>
											Names that support, incite, announce or imply a violation of the Tibia Rules.</td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td colspan=2>&nbsp;</td>
						</tr>
						<tr>
							<td><b>2.</b></td>
							<td><b>Statements</b></td>
						</tr>
						<tr>
							<td></td>
							<td><table border=0 cellpadding=0 cellspacing=3 width=100%>
									<tr>
										<td valign="top"><b>a)</b></td>
										<td><b>Offensive Statement</b><br>
											Insulting, racist, sexually related, drug-related, harassing or generally objectionable statements.</td>
									</tr>
									<tr>
										<td valign="top"><b>b)</b></td>
										<td><b>Spamming</b><br>
											Excessively repeating identical or similar statements or using badly formatted or nonsensical text.</td>
									</tr>
									<tr>
										<td valign="top"><b>c)</b></td>
										<td><b>Forbidden Advertising</b><br>
											Advertising brands, products or services of third parties, content which is not related to the game or trades for real money.</td>
									</tr>
									<tr>
										<td valign="top"><b>d)</b></td>
										<td><b>Off-Topic Public Statement</b><br>
											Religious or political public statements or other public statements which are not related to the topic of the used channel or board.</td>
									</tr>
									<tr>
										<td valign="top"><b>e)</b></td>
										<td><b>Violating Language Restriction</b><br>
											Non-English statements in boards and channels where the use of English is explicitly required.</td>
									</tr>
									<tr>
										<td valign="top"><b>f)</b></td>
										<td><b>Disclosing Personal Data of Others</b><br>
											Disclosing personal data of other people.</td>
									</tr>
									<tr>
										<td valign="top"><b>g)</b></td>
										<td><b>Supporting Rule Violation</b><br>
											Statements that support, incite, announce or imply a violation of the Tibia Rules.</td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td colspan=2>&nbsp;</td>
						</tr>
						<tr>
							<td><b>3.</b></td>
							<td><b>Cheating</b></td>
						</tr>
						<tr>
							<td></td>
							<td><table border=0 cellpadding=0 cellspacing=3 width=100%>
									<tr>
										<td valign="top"><b>a)</b></td>
										<td><b>Bug Abuse</b><br>
											Exploiting obvious errors of the game or any other part of '.$config['server']['serverName'].'\'s services.</td>
									</tr>
									<tr>
										<td valign="top"><b>b)</b></td>
										<td><b>Using Unofficial Software to Play</b><br>
											Manipulating the official client program or using additional software to play the game.</td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td colspan=2>&nbsp;</td>
						</tr>
						<tr>
							<td><b>4.</b></td>
							<td><b>'.$config['server']['serverName'].'</b></td>
						</tr>
						<tr>
							<td></td>
							<td><table border=0 cellpadding=0 cellspacing=3 width=100%>
									<tr>
										<td valign="top"><b>a)</b></td>
										<td><b>Pretending to be '.$config['server']['serverName'].'</b><br>
											Pretending to be a representative of '.$config['server']['serverName'].' or to have their legitimation or powers.</td>
									</tr>
									<tr>
										<td valign="top"><b>b)</b></td>
										<td><b>Slandering or Agitating against '.$config['server']['serverName'].'</b><br>
											Publishing clearly wrong information about or calling a boycott against '.$config['server']['serverName'].' or its services.</td>
									</tr>
									<tr>
										<td valign="top"><b>c)</b></td>
										<td><b>False Information to '.$config['server']['serverName'].'</b><br>
											Intentionally giving wrong or misleading information to '.$config['server']['serverName'].' in reports about rule violations, complaints, bug reports or support requests. </td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td colspan=2>&nbsp;</td>
						</tr>
						<tr>
							<td><b>5.</b></td>
							<td><b>Legal Issues</b></td>
						</tr>
						<tr>
							<td></td>
							<td><table border=0 cellpadding=0 cellspacing=3 width=100%>
									<tr>
										<td valign="top"><b>b)</b></td>
										<td><b>Hacking</b><br>
											Stealing other players account or personal data.</td>
									</tr>
									<tr>
										<td valign="top"><b>c)</b></td>
										<td><b>Attacking '.$config['server']['serverName'].' Service</b><br>
											Attacking, disrupting or damaging the operation of any CipSoft server, the game or any other part of '.$config['server']['serverName'].'\'s services.</td>
									</tr>
									<tr>
										<td valign="top"><b>d)</b></td>
										<td><b>Violating Law or Regulations</b><br>
											Violating any applicable law, the Tibia Service Agreement or rights of third parties.</td>
									</tr>
								</table></td>
						</tr>
						<tr>
							<td colspan=2>&nbsp;</td>
						</tr>
							</td>
						
							</tr>
						
					</table>
						</td>
					
					
						<td width=15></td>
					</tr>
				</table>
				<br>
				Violating or attempting to violate the '.$config['server']['serverName'].' Rules may lead to a temporary suspension of characters and accounts. In severe cases the removal or modification of character skills, attributes and belongings, as well as the permanent removal of characters and accounts without any compensation may be considered. The sanction is based on the seriousness of the rule violation and the previous record of the player. It is determined at the sole discretion of '.$config['server']['serverName'].' and can be imposed without any previous warning.<br>
				<br>
				These rules may be changed at any time. All changes will be announced on the official website.
				</TD>
			
				</TR>
			
		</TABLE>
			</TD>
		
			</TR>
		
	</TABLE>
	<BR>
	<BR>
	If your account or one of your characters got punished, you will find an entry in your criminal record
											on your <A HREF="?subtopic=accountmanagement">account</A> page. There you can read the reason and the duration of the punishment.<BR>
											<BR>
	Have fun !<BR>
	Your '.$config['server']['serverName'].' Team ';