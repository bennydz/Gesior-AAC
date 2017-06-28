<?PHP
// ----Config Shop----
$outfits_list = array();
$loyalty_title = array(
50 => 'Scout',
100 => 'Sentinel', 
200 => 'Steward', 
400 => 'Warden', 
1000 => 'Squire', 
2000 => 'Warrior', 
3000 => 'Keeper', 
4000 => 'Guardian', 
5000 => 'Sage');
$config['shop']['newitemdays'] = 1; #days to item be new in shop

# Pagseguro configs
$config['pagseguro']['testing'] = false; # if pagseguro testing mode
$config['pagseguro']['tokentest'] = "";

$config['pagseguro']['email'] = ""; #pagseguro e-mail
$config['pagseguro']['token'] = ""; #pagseguro token

# PayPal configs
$config['paypal']['email'] = "";

# Social Networks
$config['social']['status'] = true; # set false to disable network box
$config['social']['facebook'] = "https://www.facebook.com/tibia";

# PAGE: characters.php
$config['site']['quests'] = array(
"Demon Helmet" => 0,
"In Service of Yalahar" => 0,
"Pits Of Inferno" => 0,
"The Ancient Tombs" => 0,
"The Annihilator" => 0,
"The Demon Oak" => 0,
"Wrath Of The Emperor" => 0);

# time in days to show the former names
$config['site']['formerNames'] = 10; #days to hide former name
$config['site']['formerNames_amount'] = 10;

# Account Maker Config
$config['site']['serverPath'] = "G:\Forgotten Server/";
$config['site']['useServerConfigCache'] = false;
$towns_list = array(
1 => 'Venore', 
2 => 'Thais', 
3 => 'Kazordoon', 
4 => 'Carlin', 
5 => 'Ab\'Dendriel', 
6 => 'Rookgard', 
7 => 'Liberty Bay', 
8 => 'Port Hope', 
9 => 'Ankrahmun', 
10 => 'Darashia', 
11 => 'Edron', 
12 => 'Svargrond', 
13 => 'Yalahar', 
14 => 'Farmine', 
28 => 'Gray Beach', 
29 => 'Roshamuul', 
30 => 'Rathleton');

# Create Account Options
$config['site']['one_email'] = false;
$config['site']['create_account_verify_mail'] = false;
$config['site']['verify_code'] = true;
$config['site']['email_days_to_change'] = 3;
$config['site']['newaccount_premdays'] = 0;
$config['site']['send_register_email'] = false;

# Create Character Options
$config['site']['newchar_vocations'] = array(0 => 'Rook Sample');
$config['site']['newchar_towns'] = array(1);
$config['site']['max_players_per_account'] = 7;

# Emails Config
$config['site']['send_emails'] = true;
$config['site']['mail_address'] = "@gmail.com";
$config['site']['smtp_enabled'] = true;
$config['site']['smtp_host'] = "ssl://smtp.gmail.com";
$config['site']['smtp_port'] = 465;
$config['site']['smtp_auth'] = true;
$config['site']['smtp_user'] = "@gmail.com";
$config['site']['smtp_pass'] = "lipe0401";

# PAGE: accountmanagement.php
$config['site']['send_mail_when_change_password'] = true;
$config['site']['send_mail_when_generate_reckey'] = true;
$config['site']['email_time_change'] = 7;
$config['site']['daystodelete'] = 7;

# PAGE: guilds.php
$config['site']['guild_need_level'] = 1;
$config['site']['guild_need_pacc'] = false;
$config['site']['guild_image_size_kb'] = 50;
$config['site']['guild_description_chars_limit'] = 2000;
$config['site']['guild_description_lines_limit'] = 6;
$config['site']['guild_motd_chars_limit'] = 250;

# PAGE: adminpanel.php
$config['site']['access_admin_panel'] = 3;

# PAGE: latestnews.php
$config['site']['news_limit'] = 6;

# PAGE: killstatistics.php
$config['site']['last_deaths_limit'] = 40;

# PAGE: team.php
$config['site']['groups_support'] = array(2, 3, 4, 5, 6);

# PAGE: highscores.php
$config['site']['groups_hidden'] = array(3, 4, 5, 6);
$config['site']['accounts_hidden'] = array(1);

# PAGE: lostaccount.php
$config['site']['email_lai_sec_interval'] = 180;

# Layout Config
$config['site']['layout'] = 'tibiarl';
$config['site']['vdarkborder'] = '#505050';
$config['site']['darkborder'] = '#D4C0A1';
$config['site']['lightborder'] = '#F1E0C6';
$config['site']['download_page'] = false;
$config['site']['serverinfo_page'] = true;