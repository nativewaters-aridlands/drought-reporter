# archaeo-sites
An archaeological site name disambiguation service. [archaeo.sites]

## NMCRIS
1. Log in at [https://nmcris.dca.state.nm.us/NMCRISt/Security/SignIn.aspx]
2. Select the "Queries" tab
3. Select the "Resource Numbers (Multiple)" button under "RESOURCE QUERIES"
4. In the "Type" dropdown, select "Site"
5. Save output to CSV

## CO Compass
curl 'https://gis.colorado.gov/compass/OAHP/M_List.asp' \
-XPOST \
-H 'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' \
-H 'Content-Type: application/x-www-form-urlencoded' \
-H 'Origin: https://gis.colorado.gov' \
-H 'Cookie: gis=rd1207o00000000000000000000ffff0a0c0163o443; _ga=GA1.2.1727594992.1593715984; _gid=GA1.2.259907876.1594053910; .GPVAuth=2B97DB30EEE4ECAC3395ADEC64A9F17D47DDC831CD88548434BA1787B73EC128F76B6F72D4D4DE2E4934AB4EE666519C0C1226F4F7604CAC7DBA18F0A7B9402655F9CECA6B312FABE5FC13DAA63A316D00A85673327A2DD5E5AA8CAE5D70FF62BD046269857BB8879858EB6655FBEC070A9EADCA5ED62D4560F82F8667E2331B3C78444833E5F54B5C5CDB79EE056D08; ASP.NET_SessionId=nbpbzt50noddfuz20ngqxd4x; ASPSESSIONIDQESSSCTQ=BENFKKJBCOCCGOAOBIJGBBJC' \
-H 'Accept-Encoding: gzip, deflate, br' \
-H 'Connection: keep-alive' \
--data 'f_StartRow=26&p_Action=0&pID=0&c_Search_Screen=M_Search_e.asp&c_Title=All+Sites&c_RowsToDisplay=25&c_S_County=%ABMontezuma%BB'