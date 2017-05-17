> /root/rizwan/maliciousfiles
read -p  "Enter username: " user
Domain=$(grep $user /etc/userdomains | head -n1 | cut -d : -f1)
#python <(curl -k -s "http://scripts.websouls.com/mscan/V6/robotV6.py")  -su $user
cat /root/found_shells.log |grep  $user | grep $(date +"%Y-%m-%d") > maliciousfiles
Malicious=`cat /root/rizwan/maliciousfiles`
read -p "Do you wish to send email to client [y/n] " a
if [[ $a ==  "y" || $a == "Y" ]];
then
read -p "Enter email address: " email
echo -e  "Causes for spam ?\n 1.Plugins\n 2.Theme\n 3.Infected files\n 4.Phishing\n 5.Malware\n 6.Not Using SMTP authentication\n 7.Cron job\n 8.Contact Form\n 9.Comments Notification\n 10.Compromised CMS\n 11.Third party emails\n 12.Other"
o=`echo "y"`
while [[ $o != "n" || $o != "N" ]]
do
#echo "Enter option OR n/N to break "
read -p "Enter option OR n/N to break: " b
case $b in
1) Plugins=`echo "x"` ;;
2) Theme=`echo "x"` ;;
3) Infected=`echo "x"` ;;
4) Phishing=`echo "x"` ;;
5) Malware=`echo "x"` ;;
6) SMTP=`echo "x"` ;;
7) Cron=`echo "x"` ;;
8) Contact=`echo "x"` ;;
9) Comments=`echo "x"` ;;
10) Compromised=`echo "x"` ;;
11) Third=`echo "x"` ;;
n|N) echo "OK, see you!"
break ;;
*) echo "Enter a Valid option" ;;
esac
done
mail -r "WebSouls Support<support@websouls.com>"  -s "Malicious Content Found On your $Domain"  $email  << EOF
Dear Client,

As you might aware that we already sent you spam notification and action is due at your end. In order to maintain our strong relation, we investigated your account and performed some scanning on your behalf this time only and fixed it temporarily, you’re requested to fix it permanently to avoid such issues in future.

All content responsible for causing this spam must be fixed from the website and any misconfigured, infected, or unauthorized use of software should be investigated. The reason for spam were:

Account details:
Domain=$Domain
User=$user

[$Plugins] Plugins (Specify name of Plugins)
[$Theme] Theme
[$Infected] Infected files
[$Phishing] Phishing
[$Malware] Malware
[$SMTP] Not Using SMTP authentication
[$Cron] Cron job
[$Contact] Contact Form
[$Comments] Comments Notification
[$Compromised] Compromised CMS
[$Third] Third party emails
[] Other


Malicious files / Logs:
==========================================================================

$Malicious

==========================================================================

Please note that the website security remains to your responsibility, thank you to act accordingly.

We are awaiting your reply about this situation.


If you have any questions concerning this matter, do not hesitate to call us or to reply to this email.



EOF
fi
