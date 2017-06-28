<?PHP header("Content-Type: text/html; charset=UTF-8",true);
if(!defined('INITIALIZED'))
	exit;
$main_content .= '
	<div class="TopButtonContainer">
		<div class="TopButton">
		<a href="#top">
		<img style="border:0px;" src="'.$layout_name.'/images/global/content/back-to-top.gif"></a></div></div>
		<div class="TableContainer">
	<div class="CaptionContainer">
							<div class="CaptionInnerContainer"> 
								<span class="CaptionEdgeLeftTop" style="background-image:url('.$layout_name.'/images/global/content/box-frame-edge.gif);"></span>
								<span class="CaptionEdgeRightTop" style="background-image:url('.$layout_name.'/images/global/content/box-frame-edge.gif);"></span>
								<span class="CaptionBorderTop" style="background-image:url('.$layout_name.'/images/global/content/table-headline-border.gif);"></span> 
								<span class="CaptionVerticalLeft" style="background-image:url('.$layout_name.'/images/global/content/box-frame-vertical.gif);"></span>							
								<div class="Text">' . htmlspecialchars($config['server']['serverName']) . ' Rules</div>
								<span class="CaptionVerticalRight" style="background-image:url('.$layout_name.'/images/global/content/box-frame-vertical.gif);"></span>
								<span class="CaptionBorderBottom" style="background-image:url('.$layout_name.'/images/global/content/table-headline-border.gif);"></span> 
								<span class="CaptionEdgeLeftBottom" style="background-image:url('.$layout_name.'/images/global/content/box-frame-edge.gif);"></span>
								<span class="CaptionEdgeRightBottom" style="background-image:url('.$layout_name.'/images/global/content/box-frame-edge.gif);"></span>
							</div>
						</div><table class="Table4" cellpadding="0" cellspacing="0">
						
						<tbody><tr>
							<td>
								
									<div class="InnerTableContainer">          
		<table style="width:100%;"><tbody><tr><td>
		<div class="TableShadowContainerRightTop">  
		<div class="TableShadowRightTop" style="background-image:url('.$layout_name.'/images/global/content/table-shadow-rt.gif);"></div></div>
		<div class="TableContentAndRightShadow" style="background-image:url('.$layout_name.'/images/global/content/table-shadow-rm.gif);">
		<div class="TableContentContainer">    <table class="TableContent" width="100%"><tbody><tr><td><table style="width:100%;">
		<tbody>
		<tr><td>
<b>Before playing on our server, remember to comply as current rules and aware of all information ....</b><br><br>
			<textarea rows="10" wrap="physical" cols="100" readonly="true" width="100%" height="500px">
1. Names
a) Names which contain insulting (e.g. "Bastard"), racist (e.g. "Nigger"), extremely right-wing (e.g. "Hitler"), sexist (e.g. "Bitch") or offensive (e.g. "Copkiller") language.
b) Names containing parts of sentences (e.g. "Mike returns"), nonsensical combinations of letters (e.g. "Fgfshdsfg") or invalid formattings (e.g. "Thegreatknight").
c) Names that obviously do not describe a person (e.g. "Christmastree", "Matrix"), names of real life celebrities (e.g. "Britney Spears"), names that refer to real countries (e.g. "Swedish Druid"), names which were created to fake other players\' identities (e.g. "Arieswer" instead of "Arieswar") or official positions (e.g. "System Admin").

2. Cheating
a) Exploiting obvious errors of the game ("bugs"), for instance to duplicate items. If you find an error you must report it to CipSoft immediately.
b) Intentional abuse of weaknesses in the gameplay, for example arranging objects or players in a way that other players cannot move them.
c) Using tools to automatically perform or repeat certain actions without any interaction by the player ("macros").
d) Manipulating the client program or using additional software to play the game.
e) Trying to steal other players\' account data ("hacking").
f) Playing on more than one account at the same time ("multi-clienting").
g) Offering account data to other players or accepting other players\' account data ("account-trading/sharing").

3. Gamemasters
a) Threatening a gamemaster because of his or her actions or position as a gamemaster.
b) Pretending to be a gamemaster or to have influence on the decisions of a gamemaster.
c) Intentionally giving wrong or misleading information to a gamemaster concerning his or her investigations or making false reports about rule violations.

4. Player Killing
a) Excessive killing of characters who are not marked with a "skull" on worlds which are not PvP-enforced. Please note that killing marked characters is not a reason for a banishment.

A violation of the ' . htmlspecialchars($config['server']['serverName']) . ' Rules may lead to temporary banishment of characters and accounts. In severe cases removal or modification of character skills, attributes and belongings, as well as the permanent removal of accounts without any compensation may be considered. The sanction is based on the seriousness of the rule violation and the previous record of the player. It is determined by the gamemaster imposing the banishment.

These rules may be changed at any time. All changes will be announced on the official website.
</textarea><br><br>
As a rule and information set forth in the above dialog box can be modified without notice.<br>
If you do not agree to one of the rules of the game simply do not play on our server.<br>

		</td></tr>
		</tbody></table></td>
		  </tr></tbody></table>  </div></div><div class="TableShadowContainer"> 
		<div class="TableBottomShadow" style="background-image:url('.$layout_name.'/images/global/content/table-shadow-bm.gif);">   
		<div class="TableBottomLeftShadow" style="background-image:url('.$layout_name.'/images/global/content/table-shadow-bl.gif);"></div>  
		<div class="TableBottomRightShadow" style="background-image:url('.$layout_name.'/images/global/content/table-shadow-br.gif);"></div> 
		</div></div></td></tr>          </tbody></table>        </div>
								
							</td></tr></tbody></table>
						</div>
';
?>