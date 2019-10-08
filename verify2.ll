######################## biz 
===hellorest(dp)
private:	http://registry001.paas-test.eubrmb.com:8080
staging:	https://api.dpdev.dp.paas-test.eubrmb.com:443
production:	https://api.dpqa.dp.paas-test.eubrmb.com:443
eubrmb_app_key=hellorest-key
curl -kv "https://api.dpdev.dp.paas-test.eubrmb.com:443/hello/rest?user_key=hellorest-key"

===api-ootb(dp)
private:	https://echo-api.3scale.net:443
staging:	https://api.dpdev.dp.paas-test.eubrmb.com:443
production:	https://api.dpqa.dp.paas-test.eubrmb.com:443
eubrmb_app_key=apiootp-key
curl -kv "https://api.dpdev.dp.paas-test.eubrmb.com:443/test/api?user_key=apiootp-key"

===hellorest-ip api(ip)
private:	http://10.100.24.89:8080
staging:	http://ipgw01dev-staging.ipgwdev.svc:8080
production:	http://ipgw01qa-staging.ipgwqa.svc:8080
eubrmb_app_key=hellorest-ip-key
curl -kv "http://ipgw01dev-staging.ipgwdev.svc:8080/hello/rest?user_key=hellorest-ip-key"

===soap-ip (ip)
private:	http://10.100.5.153
staging:	http://ipgw01dev-staging.ipgwdev.svc:8080
production:	http://ipgw01qa-staging.ipgwqa.svc:8080
eubrmb_app_key=soap-ip-key
curl -kv "http://ipgw01dev-staging.ipgwdev.svc:8080/ws/countries.wsdl?user_key=soap-ip-key"

######################## proxy
===proxy-ext-dp
private:	http://dpgw01dev-staging.dpgwdev.svc:8080
staging:	https://apiq.eubrmb.com:443
production:	https://apiq2.eubrmb.com:443
host:		api.dpdev.dp.paas-test.eubrmb.com
eubrmb_app_key=proxy-ext-dp-key
curl -kv "https://apiq.eubrmb.com:443/dp/hello/rest?user_key=hellorest-key"
curl -kv "https://apiq.eubrmb.com:443/dp/test/api?user_key=apiootp-key" 

===proxy-ext-ip
private:	http://ipgw01dev-staging.ipgwdev.svc:8080
staging:	https://apiq.eubrmb.com:443
production:	https://apiq.eubrmb.com:443
host:		
user_key=proxy-ext-ip-key
curl -kv "https://apiq.eubrmb.com:443/ip/hello/rest" -H "user-key: proxy-ext-ip-key"
curl -kv "https://apiq.eubrmb.com:443/ip/hello/rest?user_key=hellorest-ip-key"
curl -kv "https://apiq.eubrmb.com:443/ip/ws/countries.wsdl?user_key=soap-ip-key"

===proxy-ip-biz
private:	http://ipgw01dev-staging.ipgwdev.svc:8080
staging:	https://api.ipdev.apps.paas-test.eubrmb.com:443
production:	https://api.ipqa.apps.paas-test.eubrmb.com:443
user_key=proxy-ip-biz-key
curl -kv "https://api.ipdev.apps.paas-test.eubrmb.com:443/hello/rest?user_key=hellorest-ip-key"
curl -kv "https://api.ipdev.apps.paas-test.eubrmb.com:443/ws/countries.wsdl?user_key=soap-ip-key"
