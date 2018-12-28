<?xml version="1.0" ?>

<TestCase name="LisaBank-GetAccountWithRequestHeaderData" version="5">

<meta>
   <create version="10.3.0" buildNumber="10.3.0.297" author="admin" date="11/09/2018" host="SARDA01P5520" />
   <lastEdited version="10.3.0" buildNumber="10.3.0.297" author="admin" date="11/09/2018" host="SARDA01P5520" />
</meta>

<id>62FE877FE40411E880E900155DA5FC02</id>
<Documentation>Put documentation of the Test Case here.</Documentation>
<IsInProject>true</IsInProject>
<sig>ZWQ9NSZ0Y3Y9NSZsaXNhdj0xMC4zLjAgKDEwLjMuMC4yOTcpJm5vZGVzPTM4NDYwNTU5Nw==</sig>
<subprocess>false</subprocess>

<initState>
</initState>

<resultState>
</resultState>

<deletedProps>
</deletedProps>

    <Node name="Web Service" log=""
          type="com.itko.lisa.ws.nx.NxWSStep" 
          version="1" 
          uid="66446349E40411E880E900155DA5FC02" 
          think="500-1S" 
          useFilters="true" 
          quiet="false" 
          next="end" > 

<wsdl></wsdl>
<endpoint>http://localhost:8001</endpoint>
<targetNamespace></targetNamespace>
<service></service>
<port></port>
<operation></operation>
<onError>abort</onError>
<maintainSession>true</maintainSession>
<clearSession>false</clearSession>
<request itko_enc="base64">PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHNvYXBlbnY6RW52ZWxvcGUgeG1sbnM6c29hcGVudj0iaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvc29hcC9lbnZlbG9wZS8iIHhtbG5zOnhzPSJodHRwOi8vd3d3LnczLm9yZy8yMDAxL1hNTFNjaGVtYSI+CiAgPHNvYXBlbnY6Qm9keT4KICAgIDxnZXRBY2NvdW50IHhtbG5zPSJodHRwOi8vZWpiMy5leGFtcGxlcy5pdGtvLmNvbS8iPgogICAgICA8YWNjb3VudElkIHhtbG5zPSIiPjE0MzM3ODUyNzk3MzI5NTk8L2FjY291bnRJZD4KICAgIDwvZ2V0QWNjb3VudD4KICA8L3NvYXBlbnY6Qm9keT4KPC9zb2FwZW52OkVudmVsb3BlPg==</request>
<style>document</style>
<use>literal</use>
<soapAction></soapAction>
<sslInfo>
<ssl-keystore-file></ssl-keystore-file>
<ssl-keystore-password-enc>l5a9a559c072db31a3fc0777f813f3a7faa59b70d71544e4d5bc48b5b3263c6ba</ssl-keystore-password-enc>
<ssl-alias></ssl-alias>
<ssl-key-password-enc>l044f35450b1757a6844ad0db9fa61740e19216394f0c75e794c4320d302b377f</ssl-key-password-enc>
</sslInfo>
<wsiInfo>
<wsi-check-wsdl>false</wsi-check-wsdl>
<wsi-check-msg>false</wsi-check-msg>
<wsi-display-type>onlyFailed</wsi-display-type>
<wsi-on-fail>continue</wsi-on-fail>
</wsiInfo>
<transport>
<soapVersionUri>1.1</soapVersionUri>
<httpVersionUri>1.1</httpVersionUri>
<webMethodUri>POST</webMethodUri>
<mtom>false</mtom>
<dontSendRequest>false</dontSendRequest>
<fault-as-error>true</fault-as-error>
<callTimeout>30000</callTimeout>
</transport>
<uddiActive>false</uddiActive>
<uddi-result>
<uddi-selection>
</uddi-selection>
</uddi-result>
<wss4jInfo>
<version>5</version>
<wssecurity>
<isSend>true</isSend>
<must>false</must>
<role></role>
</wssecurity>
<wsi-bsp>false</wsi-bsp>
</wss4jInfo>
<wsaInfo>
<useAddressing>false</useAddressing>
<must>false</must>
<to></to>
<toOverride>false</toOverride>
<toDefault>true</toDefault>
<from></from>
<fromOverride>false</fromOverride>
<fromDefault>true</fromDefault>
<action></action>
<actionOverride>false</actionOverride>
<actionDefault>true</actionDefault>
<msgid></msgid>
<msgidOverride>false</msgidOverride>
<msgidDefault>true</msgidDefault>
<replyTo></replyTo>
<replyToOverride>false</replyToOverride>
<faultTo></faultTo>
<faulttToOverride>false</faulttToOverride>
<addressingVersion>http://www.w3.org/2005/08/addressing</addressingVersion>
</wsaInfo>
<customHTTPHeaderInfo>
    <Parameter>
    <key>CustomHeader1</key>
    <value>1</value>
    </Parameter>
    <Parameter>
    <key>CustomHeader2</key>
    <value>MyHeader</value>
    </Parameter>
    <Parameter>
    <key>CustomHeader3</key>
    <value>xyz</value>
    </Parameter>
</customHTTPHeaderInfo>
<attachments>
<attachment-type>MIME</attachment-type>
</attachments>
<mtom-paths>
</mtom-paths>
    </Node>


    <Node name="abort" log=""
          type="com.itko.lisa.test.AbortStep" 
          version="1" 
          uid="62FE8781E40411E880E900155DA5FC02" 
          think="0h" 
          useFilters="true" 
          quiet="true" 
          next="" > 

    </Node>


    <Node name="fail" log=""
          type="com.itko.lisa.test.Abend" 
          version="1" 
          uid="62FE8783E40411E880E900155DA5FC02" 
          think="0h" 
          useFilters="true" 
          quiet="true" 
          next="abort" > 

    </Node>


    <Node name="end" log=""
          type="com.itko.lisa.test.NormalEnd" 
          version="1" 
          uid="62FE8785E40411E880E900155DA5FC02" 
          think="0h" 
          useFilters="true" 
          quiet="true" 
          next="fail" > 

    </Node>


</TestCase>
